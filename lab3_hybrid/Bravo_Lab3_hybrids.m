close all; clear all;

MA=im2double(imread('ma.JPG'));
JA=im2double(imread('ja.JPG'));

% Corto la imagenes del mismo tamaño tomando como centro la nariz
ma = MA(1127-525:1127+524,974-450:974+449,:);
ja = JA(1851-500:1851+499,2284-400:2284+399,:);

% Reflejo una de lás imagenes y modifico el tamaño para que se vea 
% mejor el efecto 
ma = flipdim(imresize(ma,[1000,800]),2);
imwrite(ma,'newMA.tiff');
imwrite(ja,'newJA.tiff');

% Crea el filtro gaussiano
tam = 101;
g = fspecial('gaussian', tam, tam^(1.6/3));

% Crea las imagenes filtradas 
a = imfilter(ma,g)*1.2;
bb = imfilter(ja,g)*1.2;

b = ja - imfilter(ja,g);
b = (b-min(b(:)))/(max(b(:))-min(b(:)));

aa = ma - imfilter(ma,g);
aa = (aa-min(aa(:)))/(max(aa(:))-min(aa(:)));

% Muestra las imagenes filtradas
figure(1)
subplot(231);imshow(ma);
subplot(232);imshow(a);
subplot(233);imshow(aa+0.2);
subplot(234);imshow(ja);
subplot(235);imshow(b+0.2);
subplot(236);imshow(bb);

% Crea las imagenes hibridas sumando en diferentes proporciones las
% imagenes
hybrid1 = (a*0.45+b*0.55);
hybrid2 = (aa*0.55+bb*0.45);
imwrite(hybrid1,'hibrida1.tiff');
imwrite(hybrid2,'hibrida2.tiff');

% Muestra las imagenes hibridas
figure(2)
subplot(121);imshow(hybrid1);
subplot(122);imshow(hybrid2);

% Muestra las piramides utilizando la funcion ya creada para la
% visualizacion de las piramides
figure(3)
vis1 = vis_hybrid_image(hybrid1);
imwrite(vis1,'pyramid1.tiff');
imshow(vis1);

figure(4)
vis2 = vis_hybrid_image(hybrid2);
imwrite(vis2,'pyramid2.tiff');
imshow(vis2);


