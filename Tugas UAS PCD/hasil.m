img = imread('3apel.jpg');
figure, imshow(img); title('Citra Awal');

numColors = 3;
L = imsegkmeans(img,numColors);
B = labeloverlay(img,L);
figure, imshow(B); title('Citra RGB setelah Clustering');

lab_img = rgb2lab(img);

ab = lab_img(:,:,2:3);
ab = im2single(ab);
pixel_labels = imsegkmeans(ab,numColors,"NumAttempts",3);

B2 = labeloverlay(img,pixel_labels);
figure, imshow(B2); title('Citra a*b*');

mask1 = pixel_labels == 1;
cluster1 = img.*uint8(mask1);

mask1 = pixel_labels == 2;
cluster2 = img.*uint8(mask1);

mask1 = pixel_labels == 3;
cluster3 = img.*uint8(mask1);

figure, imshow(cluster1); title('Cluster 1');
figure, imshow(cluster2); title('Cluster 2');
figure, imshow(cluster3); title('Cluster 3');