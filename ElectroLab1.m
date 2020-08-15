X = 33; % Tama?o en x en cm
d = 0.15; % Separaci?n placas en cm (0.15 cm = 1.5 mm)

dX = 0.1; % Tama?o paso en x en cm (0.1 cm = 1 mm)
dD = 0.005;% Tama?o paso separaci?n (d) en cm (0.005 cm = 0.05 mm = 50 um)

ejeX = 0: dX: X - dX; % Eje x en cm
ejeD = 0: dD: d - dD; % Eje separaci?n en cm

nX = X / dX; % Numero de puntos en X
nD = d / dD; % Numero de puntos en d

% Creamos una matriz que representa el capacitor
capacitor = zeros(nD, nX); % Con tama?o nD (vertical), nX (horizontal)

% Condiciones iniciales
VMax = 100; % Voltaje maximo en V
VMin = -100; % Voltaje minimo en V

% Aplicamos las condiciones iniciales al capacitor. En D=0, el voltaje debe
% ser maximo
capacitor(1, :) = VMax;
% Y en D = 3mm debe ser minimo
capacitor(nD, :) = VMin;

% Dibujamos el capacitor
figure(1), imagesc(ejeX, ejeD, capacitor)
xlabel('Distancia placa [cm]'), ylabel('Separaci?n [cm]'), colorbar
title('Placas con condiciones iniciales'), colormap('jet')
saveas(gcf, 'PlacasInicial.png')

%% Iteracion 1
% Pre cargamos la salida
capacitorSolucion1 = capacitor;
% Algoritmo
for i = 2: nD - 1 % Omitimos el borde sup-inf porque no hay puntos
  for j = 2: nX - 1 % Omitimos el borde izq-der porque no hay puntos
    capacitorSolucion1 (i, j) = ...
      (capacitor(i+1, j) + capacitor(i-1, j) + ...
      capacitor(i, j + 1) + capacitor(i, j - 1)) / 4;
  end
end

% El error es el valor maximo de la solucion
error1 = max(max(capacitorSolucion1(2: nD - 1, 2: nX - 1)));
errorRelativo1 = error1;

% Dibujamos el capacitor
figure(2), imagesc(ejeX, ejeD, capacitorSolucion1)
xlabel('Distancia placa [cm]'), ylabel('Separaci?n [cm]'), colorbar
title(sprintf('Placas iteracion 1, Error %.2f', errorRelativo1)), colormap('jet')
saveas(gcf, 'PlacasIter1.png')
% Las siguientes iteraciones es repetir el mismo proceso, utilizando
% capacitorSolucion1 como el nuevo inicial y creando uno nuevo como la
% salida

%% Iteracion 2
% Pre cargamos la salida
capacitorSolucion2 = capacitorSolucion1;
% Algoritmo
for i = 2: nD - 1 % Omitimos el borde sup-inf porque no hay puntos
  for j = 2: nX - 1 % Omitimos el borde izq-der porque no hay puntos
    capacitorSolucion2 (i, j) = ...
      (capacitorSolucion1(i+1, j) + capacitorSolucion1(i-1, j) ...
      + capacitorSolucion1(i, j + 1) + capacitorSolucion1(i, j - 1)) / 4;
  end
end

% El error es el valor maximo de la solucion
error2 = max(max(capacitorSolucion2(2: nD - 1, 2: nX - 1)));
errorRelativo2 = error2 - error1;

% Dibujamos el capacitor
figure(2), imagesc(ejeX, ejeD, capacitorSolucion2)
xlabel('Distancia placa [cm]'), ylabel('Separaci?n [cm]'), colorbar
title(sprintf('Placas iteracion 2, Error %.2f', errorRelativo2)), colormap('jet')
saveas(gcf, 'PlacasIter2.png')
%% Iteracion 3
% Pre cargamos la salida
capacitorSolucion3 = capacitorSolucion2;
% Algoritmo
for i = 2: nD - 1 % Omitimos el borde sup-inf porque no hay puntos
  for j = 2: nX - 1 % Omitimos el borde izq-der porque no hay puntos
    capacitorSolucion3 (i, j) = ...
      (capacitorSolucion2(i+1, j) + capacitorSolucion2(i-1, j) ...
      + capacitorSolucion2(i, j + 1) + capacitorSolucion2(i, j - 1)) / 4;
  end
end

% El error es el valor maximo de la solucion
error3 = max(max(capacitorSolucion3(2: nD - 1, 2: nX - 1)));
errorRelativo3 = error3 - error2;

% Dibujamos el capacitor
figure(3), imagesc(ejeX, ejeD, capacitorSolucion3)
xlabel('Distancia placa [cm]'), ylabel('Separaci?n [cm]'), colorbar
title(sprintf('Placas iteracion 3, Error %.2f', errorRelativo3)), colormap('jet')
saveas(gcf, 'PlacasIter3.png')
%% Iteracion 4
% Pre cargamos la salida
capacitorSolucion4 = capacitorSolucion3;
% Algoritmo
for i = 2: nD - 1 % Omitimos el borde sup-inf porque no hay puntos
  for j = 2: nX - 1 % Omitimos el borde izq-der porque no hay puntos
    capacitorSolucion4 (i, j) = ...
      (capacitorSolucion3(i+1, j) + capacitorSolucion3(i-1, j) ...
      + capacitorSolucion3(i, j + 1) + capacitorSolucion3(i, j - 1)) / 4;
  end
end

% El error es el valor maximo de la solucion
error4 = max(max(capacitorSolucion4(2: nD - 1, 2: nX - 1)));
errorRelativo4 = error4 - error3;

% Dibujamos el capacitor
figure(4), imagesc(ejeX, ejeD, capacitorSolucion4)
xlabel('Distancia placa [cm]'), ylabel('Separaci?n [cm]'), colorbar
title(sprintf('Placas iteracion 4, Error %.2f', errorRelativo4)), colormap('jet')
saveas(gcf, 'PlacasIter4.png')
%% Iteracion 5
% Pre cargamos la salida
capacitorSolucion5 = capacitorSolucion4;
% Algoritmo
for i = 2: nD - 1 % Omitimos el borde sup-inf porque no hay puntos
  for j = 2: nX - 1 % Omitimos el borde izq-der porque no hay puntos
    capacitorSolucion5 (i, j) = ...
      (capacitorSolucion4(i+1, j) + capacitorSolucion4(i-1, j) ...
      + capacitorSolucion4(i, j + 1) + capacitorSolucion4(i, j - 1)) / 4;
  end
end

% El error es el valor maximo de la solucion
error5 = max(max(capacitorSolucion5(2: nD - 1, 2: nX - 1)));
errorRelativo5 = error5 - error4;

% Dibujamos el capacitor
figure(4), imagesc(ejeX, ejeD, capacitorSolucion5)
xlabel('Distancia placa [cm]'), ylabel('Separaci?n [cm]'), colorbar
title(sprintf('Placas iteracion 5, Error %.2f', errorRelativo5)), colormap('jet')
saveas(gcf, 'PlacasIter5.png')
%% Iteracion 300

capacitorSolucion = capacitorSolucion5;

for iter = 1: 600
  % Pre cargamos la salida
  capacitorSolucionPrev = capacitorSolucion;% Solucion previa
  errorPrev = max(max(capacitorSolucion(2: nD - 1, 2: nX - 1))); % error previo
  % Algoritmo
  for i = 2: nD - 1 % Omitimos el borde sup-inf porque no hay puntos
    for j = 2: nX - 1 % Omitimos el borde izq-der porque no hay puntos
      capacitorSolucion (i, j) = ...
        (capacitorSolucionPrev(i+1, j) + capacitorSolucionPrev(i-1, j) ...
        + capacitorSolucionPrev(i, j + 1) + capacitorSolucionPrev(i, j - 1)) / 4;
    end
  end
  
  % El error es el valor maximo de la solucion
  errorN = max(max(capacitorSolucion(2: nD - 1, 2: nX - 1)));
  errorRelativoN = errorN - errorPrev;
end
% Dibujamos el capacitor
figure(6), imagesc(ejeX, ejeD, capacitorSolucion)
xlabel('Distancia placa [cm]'), ylabel('Separaci?n [cm]'), colorbar
title(sprintf('Placas iteracion %d, Error %.6f', iter + 4, errorRelativoN)), colormap('jet')
saveas(gcf, 'PlacasIter600.png')
%%
% Con efecto de borde

kernel = [0, 1, 0; 1, 0, 1; 0, 1, 0] / 4;
padSize = [60, 165];
capacitorConBorde = padarray(capacitor, padSize, 0, 'both');
ejeXConBorde = 0: dX: (1 + 2 * padSize(2) / size(capacitor, 2)) * X - dX;
ejeDConBorde = 0: dD: (1 + 2 * padSize(1) / size(capacitor, 1) )* d - dD;

for iter = 1: 600
  capacitorConBorde(padSize(1) + 1, ...
      padSize(2) + 1: padSize(2) + size(capacitor, 2)) = 100;
  capacitorConBorde(padSize(1) + size(capacitor, 1), ...
      padSize(2) + 1: padSize(2) + size(capacitor, 2)) = -100;
  capacitorConBorde = imfilter(capacitorConBorde, kernel, 'symmetric');
end

subSamp = 10;
[ejeX, ejeY] = meshgrid(ejeXConBorde, ejeDConBorde);

figure(7), imagesc(ejeXConBorde, ejeDConBorde, capacitorConBorde)
xlabel('Distancia placa [cm]'), ylabel('Distancia [cm]'), colorbar
title(sprintf('Placas iteracion 600, Error %.6f', errorRelativoN)), colormap('jet')
saveas(gcf, 'PlacasIter600ConBordes.png')

[Ux, Uy] = gradient(capacitorConBorde(1:5:end, 1:10:end));
figure(9), hold off, contour(ejeXConBorde, flipud(ejeDConBorde), flipud(capacitorConBorde))
hold on,
h1 = quiver(ejeX(1:5:end, 1:10:end), ejeY(1:5:end, 1:10:end), ...
  Ux, Uy, 0.02, ...
  'LineWidth', 1, 'AutoScaleFactor', 0.05, 'Color', [0, 0, 0], ...
  'ShowArrowHead', 'on', 'MaxHeadSize', 1e2);
ylim([0.15, 0.6])
xlim([12, 54])
xlabel('Distancia placa [cm]'), ylabel('Distancia [cm]')
title(sprintf('Placas iteracion %d, Error %.6f', iter + 4, errorRelativoN)), colormap('jet')
saveas(gcf, 'PlacasIter600ConFlechitas.png')

figure(10), hold off, imagesc(ejeXConBorde, ejeDConBorde, capacitorConBorde)
colormap(jet)
hold on,
h1 = quiver(ejeX(1:5:end, 1:10:end), ejeY(1:5:end, 1:10:end), ...
  Ux, Uy, 0.02, ...
  'LineWidth', 1, 'AutoScaleFactor', 0.05, 'AutoScale', 'off', 'Color', [0, 0, 0], ...
  'ShowArrowHead', 'on', 'MaxHeadSize', inf);
ylim([0.15, 0.6])
xlim([12, 54])
xlabel('Distancia placa [cm]'), ylabel('Distancia [cm]')
title(sprintf('Placas iteracion %d, Error %.6f', iter + 4, errorRelativoN)), colormap('jet')
saveas(gcf, 'PlacasIter600ConFlechitasContorno.png')


