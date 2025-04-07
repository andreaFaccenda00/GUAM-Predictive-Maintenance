function plotConfusionMatrix(confMat)
figure;
imagesc(confMat);
n = 256;
r = ones(n, 1);
g = linspace(0.8, 0.2, n)';
b = zeros(n, 1);
customOrangeMap = [r, g, b];
colormap(customOrangeMap);
colorbar;
numClasses = size(confMat, 1);
xticks(1:numClasses);
yticks(1:numClasses);
xlabel('Classe Predetta');
ylabel('Classe Reale');
title('Matrice di Confusione');
maxVal = max(confMat(:));
minVal = min(confMat(:));
threshold = (maxVal + minVal) / 2;
for i = 1:numClasses
    for j = 1:numClasses
        val = confMat(i, j);
        if val > threshold
            txtColor = 'white';
        else
            txtColor = 'black';
        end
        text(j, i, num2str(val), 'HorizontalAlignment', 'center', 'Color', txtColor, 'FontWeight', 'bold');
    end
end
end
