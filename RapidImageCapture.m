vid = videoinput('winvideo', 1, 'YUY2_1280x720');
vid.FramesPerTrigger = 1;
vid.ReturnedColorspace = 'rgb';
image = "image";
png = ".png";
number_pics = 20;
for c = 1:number_pics
    start(vid);
    imwrite(getdata(vid), char(image + c + png));
end
