function [ filtered ] = myfilter( src_fre,in_param,D0,D1)
%ILPF �˲���
%   src_fre ����Ƶ��ͼ�� Ĭ�����ĵ�ΪƵ�����
%   D0 ��ֹƵ��,��ͨ�͵�ͨ�˲����õ�
%   D1,D2 Ƶ�ʷ�Χ,����ʹ�ͨ�˲����õ�
params = {'l_ideal','l_butterworth','l_exponential',...
          'h_ideal','h_butterworth','h_exponential',...
          'bt_ideal','bt_butterworth',...
          'bs_ideal','bs_butterworth'};
input = strmatch(in_param,params);
center_r = 1 + size(src_fre,1)/2;
center_c = 1 + size(src_fre,2)/2;
filtered = zeros(size(src_fre));
H = zeros(size(src_fre));
m = size(H,1);
n = size(H,2);
L = 1:m*n;
T = reshape(L,m,n);
B = mod(T-1,m)+1;  %B���б��
A = floor((T-1)/m)+1;  %A���б��
% Ƶ������
K = (-1).^(A+B);
src_fre = src_fre.*K;
src_fre = DFT2(src_fre);
switch input
    case 1       
        % vectorized implementation is more efficient!
        H( sqrt((A - center_r).^2 + (B - center_c).^2) < D0) = 1;
    case 2
        %ʹ�õ�1��butterworth
        H = 1.0./(1+1.0/(D0^2)*((A-center_r).^2+(B-center_c).^2));
    case 3
        %ʹ�õ�1��
        H = exp(-((A - center_r).^2+(B - center_c).^2)/D0^2);
    case 4
        H( sqrt((A - center_r).^2 + (B - center_c).^2) > D0) = 1;
    case 5
        %ʹ�õ�1��butterworth
        H = 1.0./(1+1.0*D0^2./((A - center_r).^2+(B - center_c).^2));
    case 6
        %ʹ�õ�1��
        H = exp(-D0^2./((A - center_r).^2+(B - center_c).^2));
    case 7
        M = sqrt((A - center_r).^2 + (B - center_c).^2);
        H( M >= D0 ) = 1;
        H( M > D1) =0;
    case 8
        M = sqrt((A - center_r).^2 + (B - center_c).^2);
        AVG = (D0 + D1)/2.0;
        H = 1.0./(1 + (M*(D1-D0))./(M.^2 - AVG^2));
    case 9
        M = sqrt((A - center_r).^2 + (B - center_c).^2);
        H( M <= D0 &&...
           M >= D1 ) = 1;
    case 10
        M = sqrt((A - center_r).^2 + (B - center_c).^2);
        AVG = (D0 + D1)/2.0;
        H = 1.0./(1 + ((M.^2 - AVG^2)./M*(D1-D0)));        
end
%��Ƶ������
filtered = H.*src_fre;
filtered = IDFT2(filtered);
filtered = K.*filtered;
end

