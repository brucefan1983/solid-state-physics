function [r,L,N]=find_r(nx,ax)
r0 = [0.0, 0.0, 0.5, 0.5, 0.25, 0.25, 0.75, 0.75; ...
      0.0, 0.5, 0.0, 0.5, 0.25, 0.75, 0.25, 0.75; ...
      0.0, 0.5, 0.5, 0.0, 0.25, 0.75, 0.75, 0.25].';
n0=size(r0,1);
nxyz=nx*[1,1,1];
a=ax*[1,1,1];
L=a.*nxyz;
N=n0*prod(nxyz);
r=zeros(N,3);
n=0;
for nx=0:nxyz(1)-1
    for ny=0:nxyz(2)-1
        for nz=0:nxyz(3)-1
            for m=1:n0
                n=n+1;
                r(n,:)=a.*([nx,ny,nz]+r0(m,:));   
            end
        end
    end
end
