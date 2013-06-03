function [ dst ] = psedoColor( src )
%PSEDOCOLOR Summary of this function goes here
%   Detailed explanation goes here
%   src ‰»Îª“∂»ÕºœÒ
%   dst ‰≥ˆŒ±≤ …´ÕºœÒ

DR = 5;
DBl = 4; DBh=20;
DG = 50;

R_channel = myfilter(src,'l_ideal',DR);
B_channel = myfilter(src,'bt_ideal',DBl,DBh);
G_channel = myfilter(src,'h_ideal',DG);

dst = zeros([size(src),3]);
dst(:,:,1) = R_channel;
dst(:,:,2) = G_channel;
dst(:,:,3) = B_channel;
end

