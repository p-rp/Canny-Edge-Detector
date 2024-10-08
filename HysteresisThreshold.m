function BinaryEdgeImage = HysteresisThreshold(magnitudeImage,minThresh,maxThresh)

aboveminThresh = magnitudeImage > minThresh;
[abovemaxThreshr,abovemaxThreshc] = find(magnitudeImage > maxThresh);
BinaryEdgeImage = bwselect(aboveminThresh,abovemaxThreshc,abovemaxThreshr);
end