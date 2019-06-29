function gen_cover_kml(outkml, lon_lat_heigh, description)

if nargin < 3  
    description = '中南大学 课程设计 韩强';
end

Nc = length(outkml);

if Nc < 5
    kmlname = outkml;
    outkml = [outkml, '.kml'];
else
    kmlname = outkml(1:end-4);
end

lon_lat_heigh = sortpoint(lon_lat_heigh);

fid = fopen(outkml, 'w');

fprintf(fid, '%s\n', '<?xml version="1.0" encoding="UTF-8"?>');
fprintf(fid, '%s\n', '<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">');
fprintf(fid, '%s\n', '<Document>');
namestr = ['	<name>',outkml,'</name>'];
fprintf(fid, '%s\n', namestr);
fprintf(fid, '%s\n', '	<StyleMap id="m_ylw-pushpin0">');
fprintf(fid, '%s\n', '		<Pair>');
fprintf(fid, '%s\n', '			<key>normal</key>');
fprintf(fid, '%s\n', '			<styleUrl>#s_ylw-pushpin</styleUrl>');
fprintf(fid, '%s\n', '		</Pair>');
fprintf(fid, '%s\n', '		<Pair>');
fprintf(fid, '%s\n', '			<key>highlight</key>');
fprintf(fid, '%s\n', '			<styleUrl>#s_ylw-pushpin_hl</styleUrl>');
fprintf(fid, '%s\n', '		</Pair>');
fprintf(fid, '%s\n', '	</StyleMap>');
fprintf(fid, '%s\n', '	<Style id="s_ylw-pushpin">');
fprintf(fid, '%s\n', '		<IconStyle>');
fprintf(fid, '%s\n', '			<scale>1.1</scale>');
fprintf(fid, '%s\n', '			<Icon>');
fprintf(fid, '%s\n', '				<href>http://maps.google.com/mapfiles/kml/pushpin/ylw-pushpin.png</href>');
fprintf(fid, '%s\n', '			</Icon>');
fprintf(fid, '%s\n', '			<hotSpot x="20" y="2" xunits="pixels" yunits="pixels"/>');
fprintf(fid, '%s\n', '		</IconStyle>');
fprintf(fid, '%s\n', '		<LineStyle>');
fprintf(fid, '%s\n', '			<color>ff0400ff</color>');
fprintf(fid, '%s\n', '			<width>3</width>');
fprintf(fid, '%s\n', '		</LineStyle>');
fprintf(fid, '%s\n', '		<PolyStyle>');
fprintf(fid, '%s\n', '			<fill>0</fill>');
fprintf(fid, '%s\n', '		</PolyStyle>');
fprintf(fid, '%s\n', '	</Style>');
fprintf(fid, '%s\n', '	<Style id="s_ylw-pushpin_hl">');
fprintf(fid, '%s\n', '		<IconStyle>');
fprintf(fid, '%s\n', '			<scale>1.3</scale>');
fprintf(fid, '%s\n', '			<Icon>');
fprintf(fid, '%s\n', '				<href>http://maps.google.com/mapfiles/kml/pushpin/ylw-pushpin.png</href>');
fprintf(fid, '%s\n', '			</Icon>');
fprintf(fid, '%s\n', '			<hotSpot x="20" y="2" xunits="pixels" yunits="pixels"/>');
fprintf(fid, '%s\n', '		</IconStyle>');
fprintf(fid, '%s\n', '		<LineStyle>');
fprintf(fid, '%s\n', '			<color>ff0400ff</color>');
fprintf(fid, '%s\n', '			<width>3</width>');
fprintf(fid, '%s\n', '		</LineStyle>');
fprintf(fid, '%s\n', '		<PolyStyle>');
fprintf(fid, '%s\n', '			<fill>0</fill>');
fprintf(fid, '%s\n', '		</PolyStyle>');
fprintf(fid, '%s\n', '	</Style>');
fprintf(fid, '%s\n', '	<Placemark>');
namestr = ['		<name>', kmlname, '</name>'];
fprintf(fid, '%s\n', namestr);
fprintf(fid, '%s\n', ['		<description>', description, ' </description>'] );
fprintf(fid, '%s\n', '		<styleUrl>#m_ylw-pushpin0</styleUrl>');
fprintf(fid, '%s\n', '		<Polygon>');
fprintf(fid, '%s\n', '			<tessellate>1</tessellate>');
fprintf(fid, '%s\n', '			<outerBoundaryIs>');
fprintf(fid, '%s\n', '				<LinearRing>');
fprintf(fid, '%s\n', '					<coordinates>');

lonlatstr = '						';
[m, n] = size(lon_lat_heigh);
if n < 3
    lon_lat_heigh(:, 3) = 0;
end

for i = 1 : m
    lonlatstr = [lonlatstr, num2str(lon_lat_heigh(i,1), '%12.8f'), ',' num2str(lon_lat_heigh(i,2), '%12.8f'), ',', num2str(lon_lat_heigh(i,3), '%12.8f'), ' '];
end
fprintf(fid, '%s\n', lonlatstr);
fprintf(fid, '%s\n', '					</coordinates>');
fprintf(fid, '%s\n', '				</LinearRing>');
fprintf(fid, '%s\n', '			</outerBoundaryIs>');
fprintf(fid, '%s\n', '		</Polygon>');
fprintf(fid, '%s\n', '	</Placemark>');
fprintf(fid, '%s\n', '</Document>');
fprintf(fid, '%s\n', '</kml>');

fclose(fid);


end



function out = sortpoint(lon_lat_heigh)
deg2meter = 108000;
 lonlat = lon_lat_heigh(:, 1:2) * deg2meter;
 
 center = mean(lonlat);
 
 NPoints = size(lonlat, 1);

 dlonlat = lonlat - repmat(center, NPoints, 1);
 
 
 azimuth_angle = zeros(NPoints,1);
 
 for i = 1 : NPoints
     dx = dlonlat(i, 1);
     dy = dlonlat(i, 2);
     azimuth_angle(i) = atan2(dy, dx)*180/pi;
     
     if dy < 0
         azimuth_angle(i) = azimuth_angle(i) + 360;
     end
     
 end

[~, ix] = sort(azimuth_angle);

out = lon_lat_heigh(ix, :);

out = [out; out(1, :)];


end
