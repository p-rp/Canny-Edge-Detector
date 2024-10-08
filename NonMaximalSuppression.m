function newMagnitudeImage = NonMaximalSuppression(magnitude,orientation)

[YY,XX] = size(magnitude);
newMagnitudeImage = zeros(YY,XX);
tmp = newMagnitudeImage;

%the comparison for horizontal to find horizontal edges:
horMag = ((orientation>(-pi/8))&(orientation<=(pi/8)))|((orientation>(7*pi/8))|(orientation<=(-7*pi/8)));
tmp(:,2:XX) = magnitude(:,1:XX-1);
comp1 = horMag & ((magnitude-tmp)>0);
tmp = zeros(YY,XX);
tmp(:,1:XX-1) = magnitude(:,2:XX);
comp2 = horMag & ((magnitude-tmp)>0);
newMagnitudeImage = newMagnitudeImage + magnitude .*(comp1&comp2);

%the comparison for 45deg to find 45deg edges:
tmp = zeros(YY,XX);
fortyfiveMag = ((orientation>(pi/8))&(orientation<=(3*pi/8)))|((orientation>(-7*pi/8))&(orientation<=(-5*pi/8)));
tmp(2:YY,2:XX) = magnitude(1:YY-1,1:XX-1);
comp1 = fortyfiveMag & ((magnitude-tmp)>0);
tmp = zeros(YY,XX);
tmp(1:YY-1,1:XX-1) = magnitude(2:YY,2:XX);
comp2 = fortyfiveMag & ((magnitude-tmp)>0);
newMagnitudeImage = newMagnitudeImage + magnitude .*(comp1&comp2);

%the comparison for vertical to find vertical edges:
tmp = zeros(YY,XX);
verticalMag = ((orientation>(3*pi/8))&(orientation<=(5*pi/8)))|((orientation>(-5*pi/8))&(orientation<=(-3*pi/8)));
tmp(2:YY,:) = magnitude(1:YY-1,:);
comp1 = verticalMag & ((magnitude-tmp)>0);
tmp = zeros(YY,XX);
tmp(1:YY-1,:) = magnitude(2:YY,:);
comp2 = verticalMag & ((magnitude-tmp)>0);
newMagnitudeImage = newMagnitudeImage + magnitude .*(comp1&comp2);

%the comparison for -45deg to find -45deg edges:
tmp = zeros(YY,XX);
mfortyfiveMag = ((orientation>(5*pi/8))&(orientation<=(7*pi/8)))|((orientation>(-3*pi/8))&(orientation<=(-pi/8)));
tmp(1:YY-1,2:XX) = magnitude(2:YY,1:XX-1);
comp1 = mfortyfiveMag & ((magnitude-tmp)>0);
tmp = zeros(YY,XX);
tmp(2:YY,1:XX-1) = magnitude(1:YY-1,2:XX);
comp2 = mfortyfiveMag & ((magnitude-tmp)>0);
newMagnitudeImage = newMagnitudeImage + magnitude .*(comp1&comp2);
end
