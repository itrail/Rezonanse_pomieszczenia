X = [0:15];
X = unique(nchoosek(repmat(X, 1,4), 3), 'rows');
X = fliplr(X(2:size(X,1), :));

c= 340.3;                                   %// predkosc dzwieku w m/s
L = 4.8;                                    %// dlugosc w m
W = 2.3;                                   %//szerokośc w m
H = 3;                                    %//wysokosc w m

F = [X c/2 * (sqrt( (X(:,1).^2/L.^2) + (X(:,2).^2/W.^2) + (X(:,3).^2/H.^2) ))];
F = sortrows(F, F(4))

os = (F(:,1) == 0 & F(:,2) == 0 | F(:,1) == 0 & F(:,3) == 0 | F(:,3) == 0 & F(:,2) == 0 ) ;
R_os = F(os, :);                            %//Rezonanse osiowe

st = F(:,1) == 0 & F(:,2) >0 & F(:,3) > 0 | F(:,2) == 0 & F(:,1) >0 & F(:,3) > 0  | F(:,3) == 0 & F(:,2) >0 & F(:,1) > 0 ;
R_st = F(st, :);                            %//Rezonanse styczne

R_sk = F(~st & ~os,:);                      %//Rezonanse skośne

plot(R_sk(:,4), 1, 'r.', 'MarkerSize',5)
title('Częstotliwości rezonansu dla badanego pomieszczenia')
xlabel('Częstotliwość - Hz')
hold on 
plot(R_st(:,4), 2, 'g.', 'MarkerSize',5)
hold on
plot(R_os(:,4), 3, 'b.', 'MarkerSize',5)
hold off
