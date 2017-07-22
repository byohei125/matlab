yuragi = zeros(1,1000);
e = 1;
aw = pi / 5;
bw = pi / 3;
cw = 1;
n = pi / 3;
tajudo = 4;

y1 = 2 * pi;
yuragimax = 0;
yuragiave = 0;%中央値がベスト
for x = 1:300
    for i = 1:tajudo
        x1 = x  / pi / 6;
        fw1 = sin(x1 + aw * sin(bw * y1) + (i - 1) * cw);
        fw2 = sin(y1 + aw * sin(bw * x1) + (i - 1) * cw);
        yuragiw = (sin(n.^(i-1)) * fw1 + sin(n.^(i-1)) * fw2) / (n.^(e * (i-1)));
        yuragi(x) = yuragi(x) + yuragiw;
    end
    if yuragimax < yuragi(x)
        yuragimax = yuragi(x);
    end
    yuragiave = yuragiave + yuragi(x);
end
yuragiave = yuragiave / 300;
yuragi_range_setting = 1.0;
yuragi_range = 0.2;
while (yuragimax / yuragi_range_setting > yuragi_range)
    yuragi_range_setting = yuragi_range_setting + 0.00000001;
end
for x = 1:300
    yuragi(x) = yuragi(x) / yuragi_range_setting + 1.0 - 1.0;%出来れば中央値を引きたい
end
x = 1:300;
plot(x,yuragi(x),'r:+')