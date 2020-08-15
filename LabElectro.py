import math
import numpy as np

Nx = 330;    # Número de cuadrículas en el eje x. Cada cuadrícula = 1mm
Ny = 3;      # Número de cuadrículas en el eje x. Cada cuadrícula = 1mm
mpx = math.ceil(Nx/2);# % Mid-point of x
mpy = math.ceil(Ny/2); #% Mid point of y

N = 500;

V = np.zeros(Nx,Ny);   # Potential (Voltage) matrix

T = 0;           # % Top-wall potential
B = 0;            #% Bottom-wall potential
L = 0;            #% Left-wall potential
R = 0;            #% Right-wall potential

V[1,:] = L;
V[Nx,:] = R;
V[:,1] = B;
V[:,Ny] = T;

V[1,1] = 0.5*(V(1,2)+V(2,1));
V[Nx,1] = 0.5*(V(Nx-1,1)+V(Nx,2));
V[1,Ny] = 0.5*(V(1,Ny-1)+V(2,Ny));
V[Nx,Ny] = 0.5*(V(Nx,Ny-1)+V(Nx-1,Ny));

length_plate = 150;  #Length of plate in terms of number of grids  
lp = math.floor(length_plate/2);

position_plate = 15; #Position of plate on x axis
pp1 = mpx+position_plate;
pp2 = mpx-position_plate;

for z in range(1, N): # Number of iterations
        
   for i in range(2, Nx-1):
       for j in range(2, Ny-1):      
            
            # % The next two lines are meant to force the matrix to hold the 
            # % potential values for all iterations
            
                V[pp1,mpy-lp:mpy+lp] = 100;
                V[pp2,mpy-lp:mpy+lp] = -100;
                
                V(i,j)=0.25*(V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1));

V = V1;

[Ex,Ey]=gradient(V);
Ex = -Ex;
Ey = -Ey;

E = sqrt(Ex**2+Ey**2);  

x = [1, Nx]-mpx;
y = [1, Ny]-mpy;

figure(1)
contour_range_V = -101:0.5:101;
contour(x,y,V,contour_range_V,'linewidth',0.5);
axis([min(x) max(x) min(y) max(y)]);
colorbar('location','eastoutside','fontsize',14);
xlabel('x-axis in meters','fontsize',14);
ylabel('y-axis in meters','fontsize',14);
title('Electric Potential distribution, V(x,y) in volts','fontsize',14);
h1=gca;
set(h1,'fontsize',14);
fh1 = figure(1); 
set(fh1, 'color', 'white')

figure(2)
contour_range_E = -20:0.05:20;
contour(x,y,E,contour_range_E,'linewidth',0.5);
axis([min(x) max(x) min(y) max(y)]);
colorbar('location','eastoutside','fontsize',14);
xlabel('x-axis in meters','fontsize',14);
ylabel('y-axis in meters','fontsize',14);
title('Electric field distribution, E (x,y) in V/m','fontsize',14);
h2=gca;
set(h2,'fontsize',14);
fh2 = figure(2); 
set(fh2, 'color', 'white')

figure(3)
contour(x,y,E,'linewidth',0.5);
hold on, quiver(x,y,Ex,Ey,2)
title('Electric field Lines, E (x,y) in V/m','fontsize',14);
axis([min(x) max(x) min(y) max(y)]);
colorbar('location','eastoutside','fontsize',14);
xlabel('x-axis in meters','fontsize',14);
ylabel('y-axis in meters','fontsize',14);
h3=gca;
set(h3,'fontsize',14);
fh3 = figure(3); 
set(fh3, 'color', 'white')

