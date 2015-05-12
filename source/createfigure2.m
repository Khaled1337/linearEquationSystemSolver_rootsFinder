function createfigure (str,xl,xu)
figure1 = figure;
axes('Parent',figure1,...
    'Position',[0.0107142857142857 0.00476190476190476 0.978571428571429 0.980952380952381]);
hold on
g1=ezplot( inline('0'));
set(g1,'color','black','LineWidth',2);
g2=plot(zeros(1001),[-500:500]);
set(g2,'color','black','LineWidth',2);
pause(0.5);
g1=ezplot( inline(str));
set(g1,'LineWidth',2);
temp=ones(1001);
for j =1:length(xl)
pause(0.25);
plot(temp*xl(j),[-500:500]);
plot(temp*xu(j),[-500:500]);     
end
hold off