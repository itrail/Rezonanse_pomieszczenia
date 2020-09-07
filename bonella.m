oktawy
X = []
temp =0;
for i=1:size(V,1)-1
    R = F(:,4) <= V(i+1) & F(:,4) > V(i)
    X = [X; V(i) V(i+1) sum(R)]
end

plot(V(2:size(V,1)),X(:,3),'-o')
xlim([0 200])
title('Charakterystyka drgañ w³asnych pomieszczenia')
xlabel('Czêstotliwoœæ - Hz')
ylabel('Gêstoœc drgañ w³asnych - rezonansów na 1/3 oktawy')