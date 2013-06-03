cor00=[0,1]; cor01=[1,1];
cor10=[-1,0]; cor11=[0,0];

cord=[cor00;cor01;cor10;cor11];
output=BinaryInterpolate(cor00,cor01,cor10,cor11,0.99,0.99);
figure; 
plot(cord(:,1), cord(:,2), 'k+', 'LineWidth', 2, 'MarkerSize',7);
hold on;
plot(output(:,1),output(:,2), 'ko', 'MarkerFaceColor','y', 'MarkerSize', 7);
