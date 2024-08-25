# camera.py
###import f_Face_info
import cv2
import PIL.Image
from PIL import Image
import time
import imutils
import argparse
import shutil
import pytesseract
import imagehash
import json
import PIL.Image
from PIL import Image
from PIL import ImageTk
from random import randint

from deepface import DeepFace


import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  charset="utf8",
  database="class_skipper"
)


class VideoCamera(object):
    def __init__(self):
        # Using OpenCV to capture from device 0. If you have trouble capturing
        # from a webcam, comment the line below out and use a video file
        # instead.

        #Live Video Capture
        self.video = cv2.VideoCapture(0)
        ##FR
        self.video.set(3, 640) # set video widht
        self.video.set(4, 480) # set video height

        # Define min window size to be recognized as a face
        self.minW = 0.1*self.video.get(3)
        self.minH = 0.1*self.video.get(4)
        ##
        self.k=1
        #cap = self.video
        # If you decide to use video.mp4, you must have this file in the folder
        # as the main.py.
        #self.video = cv2.VideoCapture('video.mp4')

        # Check if camera opened successfully
        #if (cap.isOpened() == False): 
        #  print("Unable to read camera feed")

        # Default resolutions of the frame are obtained.The default resolutions are system dependent.
        # We convert the resolutions from float to integer.
        #frame_width = int(cap.get(3))
        #frame_height = int(cap.get(4))

        # Define the codec and create VideoWriter object.The output is stored in 'outpy.avi' file.
        #self.out = cv2.VideoWriter('video.avi',cv2.VideoWriter_fourcc('M','J','P','G'), 10, (frame_width,frame_height))


        
    
    def __del__(self):
        self.video.release()
        
    
    def get_frame(self):
        success, image = self.video.read()
        #self.out.write(image)

        cv2.imwrite("static/getimg.jpg", image)
        
        face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')

        # Read the frame
        #_, img = cap.read()

        # Convert to grayscale
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

        # Detect the faces
        faces = face_cascade.detectMultiScale(gray, 1.1, 4)

        #Feature Extraction-Local Binary Patterns  (LBP)
        ###FR
        id = 0
        recognizer = cv2.face.LBPHFaceRecognizer_create()
        recognizer.read('trainer/trainer.yml')
        cascadePath = "haarcascade_frontalface_default.xml"
        faceCascade = cv2.CascadeClassifier(cascadePath);

        font = cv2.FONT_HERSHEY_SIMPLEX
        gray = cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)

        faces = faceCascade.detectMultiScale( 
            gray,
            scaleFactor = 1.2,
            minNeighbors = 5,
            minSize = (int(self.minW), int(self.minH)),
           )
        
        # Draw the rectangle around each face
        j = 1

        ff=open("user.txt","r")
        uu=ff.read()
        ff.close()

        ff=open("user1.txt","r")
        uuid=ff.read()
        ff.close()

        ff1=open("photo.txt","r")
        uu1=ff1.read()
        ff1.close()
        
        
        
        try:
            cursor = mydb.cursor()
            #Frame Extraction        
            j=1
            for (x, y, w, h) in faces:
                ##FR
                cv2.rectangle(image, (x,y), (x+w,y+h), (0,255,0), 2)

                id, confidence = recognizer.predict(gray[y:y+h,x:x+w])
                idd=id
                cursor.execute('SELECT * FROM register where id=%s',(id,))
                fdata = cursor.fetchone()
                name=fdata[1]
                
                # Check if confidence is less them 100 ==> "0" is perfect match 
                if (confidence < 50):
                    id = name
                    #namex[id]
                    confidence = "  {0}%".format(round(100 - confidence))
                    ff=open("static/cam1.txt","w")
                    ff.write(str(idd))
                    ff.close()
                    
                else:
                    id = "unknown"
                    confidence = "  {0}%".format(round(100 - confidence))
                
                cv2.putText(image, str(id), (x+5,y-5), font, 0.5, (255,255,255), 1)
                #cv2.putText(image, str(confidence), (x+5,y+h-5), font, 1, (255,255,0), 1)  
            
                
                ##
                #mm=cv2.rectangle(image, (x, y), (x+w, y+h), (0, 200, 0), 1)
                #cv2.imwrite("static/myface.jpg", mm)

                #image1 = cv2.imread("static/myface.jpg")
                #cropped = image1[y:y+h, x:x+w]
                #gg="f"+str(j)+".jpg"
                #cv2.imwrite("static/faces/"+gg, cropped)

                j+=1
        except:
            print("try")

        '''cutoff=8
        act="1"
        res=""
        cursor = mydb.cursor()
        cursor.execute('SELECT * FROM vt_face')
        dt = cursor.fetchall()
        j2=1
        res2=""
        while j2<=j:
            for rr in dt:
                hash0 = imagehash.average_hash(Image.open("static/frame/"+rr[2])) 
                hash1 = imagehash.average_hash(Image.open("static/faces/f"+str(j2)+".jpg"))
                cc1=hash0 - hash1
                
                if cc1<=cutoff:
                    vid=rr[1]
                    cursor.execute('SELECT * FROM train_data where id=%s',(vid,))
                    rw = cursor.fetchone()
                    res=rw[2]
                    msg="Hai "+rw[2]
                    
                    break
                else:
                    res="unknown"
                    msg="Unknown person found"
                    

            res2+=res+"|"
            ff=open("person.txt","w")
            ff.write(res2)
            ff.close()
            j2+=1'''
        ##########################
        parser1 = argparse.ArgumentParser(description="Face Info")
        parser1.add_argument('--input', type=str, default= 'webcam',
                            help="webcam or image")
        parser1.add_argument('--path_im', type=str,
                            help="path of image")
        args1 = vars(parser1.parse_args())

        type_input1 = args1['input']
        ###########################################
        '''star_time = time.time()
        #ret, frame = cam.read()
        frame = imutils.resize(image, width=720)
        
        # obtenego info del frame
        out = f_Face_info.get_face_info(frame)
        # pintar imagen
        image = f_Face_info.bounding_box(out,frame)

        end_time = time.time() - star_time    
        FPS = 1/end_time
        cv2.putText(image,f"FPS: {round(FPS,3)}",(10,50),cv2.FONT_HERSHEY_COMPLEX,1,(0,0,255),2)
        '''
        #############
        
        

            
        # We are using Motion JPEG, but OpenCV defaults to capture raw images,
        # so we must encode it into JPEG in order to correctly display the
        # video stream.
        ret, jpeg = cv2.imencode('.jpg', image)
        return jpeg.tobytes()
