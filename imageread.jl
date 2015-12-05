using PyPlot

function imageread(img)
image = imread(img)
return image[:,:,3]
end
