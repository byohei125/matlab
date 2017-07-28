yuragi_x = zeros(1,1000);
yuragi_w = zeros(1,1000);
e = 1;
ax = 1; bx = pi / 3; cx = 1;
aw = 1; bw = pi / 3; cw = 1;
nx = pi / 2; tajudox = 3;
nw = pi / 3; tajudow = 4;

y1 = 2 * pi; %y1 = 100;

%位置のゆらぎ
yuragixmax = 0;
for x = 1:300
    for i = 1:tajudox
        x1 = x  / pi / 4;
        fx1 = sin(x1 + ax * sin(bx * y1) + (i - 1) * cx);
        fx2 = sin(y1 + ax * sin(bx * x1) + (i - 1) * cx);
        yuragix = (sin(nx.^(i-1)) * fx1 + sin(nx.^(i-1)) * fx2) / (nx.^(e * (i-1)));
        yuragi_x(x) = yuragi_x(x) + yuragix;
    end
    if yuragixmax < yuragi_x(x)
        yuragixmax = yuragi_x(x);
    end
end
yuragi_range_setting_x = 1.0; 
yuragi_range_x = 0.05;
while (yuragixmax / yuragi_range_setting_x > yuragi_range_x)
    yuragi_range_setting_x = yuragi_range_setting_x + 0.00000001;
end

%大きさのゆらぎ
yuragiwmax = 0;
for x = 1:300
    for i = 1:tajudow
        x1 = x  / pi / 4;
         fw1 = sin(x1 + aw * sin(bw * y1) + (i - 1) * cw);
        fw2 = sin(y1 + aw * sin(bw * x1) + (i - 1) * cw);
        yuragiw = (sin(nw.^(i-1)) * fw1 + sin(nw.^(i-1)) * fw2) / (nw.^(e * (i-1)));
        yuragi_w(x) = yuragi_w(x) + yuragiw;
    end
    if yuragiwmax < yuragi_w(x)
        yuragiwmax = yuragi_w(x);
    end
end
yuragi_range_setting_w = 1.0;
yuragi_range_w = 0.05;
while (yuragiwmax / yuragi_range_setting_w > yuragi_range_w)
    yuragi_range_setting_w = yuragi_range_setting_w + 0.00000001;
end

%Plot用に計算
for x = 1:300
    yuragi_x(x) = yuragi_x(x) / yuragi_range_setting_x + 1.0;
    yuragi_w(x) = yuragi_w(x) / yuragi_range_setting_w + 1.0;
end
x = 1:300;
subplot(2,1,1)
plot(x,yuragi_x(x),'b-')
title('位置のゆらぎ', 'FontSize', 20)
xlabel('位置x (yは一定)', 'FontSize', 20)
ylabel('ゆらぎ量Az', 'FontSize', 20)
set(gca, 'FontSize', 16)%軸の目盛のフォントサイズ変更
subplot(2,1,2)
plot(x,yuragi_w(x),'r-')
title('大きさのゆらぎ', 'FontSize', 20)
xlabel('位置x (yは一定)', 'FontSize', 20)
ylabel('ゆらぎ量Az', 'FontSize', 20)
set(gca, 'FontSize', 16)