rezonanse
R1 = R_os(2:size(R_os,1),4)
R2 = R_os(1:size(R_os,1)-1,4)
R_os = [R_os(1:size(R2),:) floor([ R1 - R2])]