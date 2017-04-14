clf
clear all
close all
figure(1)
% written by hang deng
% code for plot Monterey Canyon along-strike depth profile through
% time, same location of along-strike depth profile
table=readtable('Monterey Canyon cross sections.xlsx');

% calculate difference between 2 lines through integration
A1=trapz(table{:,1},table{:,2});
A2=trapz(table{:,1},table{:,3});
A3=trapz(table{:,1},table{:,4});
A4=trapz(table{:,1},table{:,5});
A21=A2-A1;
A32=A3-A2;
A43=A4-A3;

%subplot of 2003-2014 depth profile
subplot(2,2,1);
plot(table{:,1},table{:,2});
% figure improvement
xlim([0 max(table{:,1})]);
hold on
plot(table{:,1},table{:,3});
hold on
plot(table{:,1},table{:,4},'m');
hold on
plot(table{:,1},table{:,5},'g');
legend('2003 z','2006 z','2008 z','2014 z');
title('Depth change(m) through 2003-2014');
ylim([-160 0]);

% subplot of Z between 2003-2006
subplot(2,2,2);
plot(table{:,1},table{:,2});
xlim([0 max(table{:,1})]);
hold on
plot(table{:,1},table{:,3});
title('Depth change(m) through 2003-2006');
hold on
%x0306=[table{:,1} fliplr(table{:,1})];
%y0306=[table{:,2} fliplr(table{:,3})];
%fill(x0306,y0306,-150,'b');
hold on
a1=area(table{:,1},table{:,3},-160,'LineStyle','none');
hold on
a2=area(table{:,1},table{:,2},-160,'LineStyle','none');
hold on
set(a1,'FaceColor','y')
alpha(.5);
set(a2,'FaceColor','k')
alpha(.5);
%a54=table(table{:,1},table{:,2});
%a3=area(a54{:,1},a54{:,2},-160,'LineStyle','none');
hold on
legend('2003 z','2006 z','Deposition','Erosion')

%figure(2)
%subplot of Z between 2006-2008
subplot(2,2,3);
plot(table{:,1},table{:,3});
xlim([0 max(table{:,1})]);
hold on
plot(table{:,1},table{:,4},'m');
% fill area
hold on
b1=area(table{:,1},table{:,3},-160,'LineStyle','none');
hold on
b2=area(table{:,1},table{:,4},-160,'LineStyle','none');
hold on
set(b1,'FaceColor','k')
alpha(.3);
hold on
set(b2,'FaceColor','y')
alpha(.5);
hold on
b2=area(table{:,1},table{:,4},-160,'LineStyle','none');
b54=table(length(table{:,1}),1);
for i = 1:length(table{:,1})
    if table{i,3}<table{i,4}
    b54(i,1)=table(i,3);
    else
        b54(i,1)=table(i,4);
    end
end
hold on
%plot(table{:,1},b54{:,1},'Linewidth',0.1,'LineStyle','none');
%hold on
b3=area(table{:,1},b54{:,1},-160,'LineStyle','none');
set(b3,'FaceColor','k');
alpha(.3);
set(b2,'FaceColor','y')
alpha(.5);
hold on
title('Depth change(m) through 2006-2008');
legend('2006 z','2008 z','Erosion','Deposition');



% subplot of Z between 2008-2014
subplot(2,2,4);
plot(table{:,1},table{:,4});
xlim([0 max(table{:,1})]);
hold on
plot(table{:,1},table{:,5},'g');
% fill area
hold on
c1=area(table{:,1},table{:,4},-160,'LineStyle','none');
hold on
c2=area(table{:,1},table{:,5},-160,'LineStyle','none');
hold on
set(c1,'FaceColor','k')
alpha(.3);
hold on
set(c2,'FaceColor','y')
alpha(.5);
hold on
c54=table(length(table{:,1}),1);
for i = 1:length(table{:,1})
    if table{i,4}<table{i,5}
    c54(i,1)=table(i,4);
    else
        c54(i,1)=table(i,5);
    end
end
c3=area(table{:,1},c54{:,1},-160,'LineStyle','none');
set(c3,'FaceColor','k');
alpha(.5);
hold on
title('Depth change(m) through 2008-2014');
legend('2008 z','2014 z','Erosion','Deposition');

