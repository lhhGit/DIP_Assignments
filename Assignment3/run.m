done = 0;
while 1
    if(done == 0)
    file=input('Edge Detection, choose a file\n','s');
    done = 1;
    else
    r=input('Change Image File? Y/N','s');
    if(r=='Y')
        file=input('choose a file\n','s');
    end
    end
    num=input('Edge Detection, choose a method:\n1)Sobel\n2)Prewitt\n3)Roberts\n4)Marr\n5)Canny\n0)Exit\n');
    if(num>0) 
        edge_detect(num,imread(file));
    else
        break;
    end    
    fprintf('program paused, press any key to continue...\n');
    pause;
end