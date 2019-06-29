load B.mat;
format long e;
L_size = size(L);
boundary =[];
for k = 1:length(B)
   boundary = [boundary;B{k}];
end
boundary_size = size(boundary);

[A,R]=geotiffread('2016.tif');
A1 = R.LongitudeLimits(1);
B1 =  R.LatitudeLimits(1);
A2 = R.LongitudeLimits(2);
B2 = R.LatitudeLimits(2);

lon_unit = (A2-A1) / L_size(1);
lat_unit = (B2-B1) / L_size(2);

lonat = [];
for i = 1:boundary_size(1)
    temp_lon = A1 + boundary(i,1)*lon_unit;
    temp_lat = B2 - boundary(i,2)*lat_unit;
    lonat=[lonat;temp_lon temp_lat 0];
end



