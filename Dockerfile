FROM osrm/osrm-backend:v5.20.0
LABEL maintainer="Asdrubal Gonzalez"
ENV pbf=georgia-latest.osm.pbf version=1.1 osrm=georgia-latest.osrm
VOLUME [ "./:/data" ]
WORKDIR /data
RUN wget http://download.geofabrik.de/europe/${pbf} \
&& osrm-extract -p /opt/car.lua /data/${pbf} \
&& osrm-partition /data/${osrm} \
&& osrm-customize /data/${osrm}
