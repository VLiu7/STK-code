%��γ��ת�������ĺ���
raan=259.883;
N=16;
m=2;
k=1;%����k+1��
inclination=70;%���
cycle=24*3600/(N-m);%һȦ����
dtr=pi/180;
i=0;
omiga=pi/(3600*12);
weidu=[];%��㣬��1�����ǵ����µ�켣��γ�����д����
jingdu=[];%���ϵĲ��֣��������
jingdu_r=[];%���µĲ��֣��������

j=[raan];
w=[0];
for t=1:cycle/4
    temp_w=asin(sin(inclination*dtr)*sin((N-m)*omiga*t));
    temp_j=atan(cos(inclination*dtr)*tan((N-m)*omiga*t))-omiga*t;
    w=[temp_w/dtr,w,-temp_w/dtr];
    j=[mod(raan+temp_j/dtr,360),j,mod(raan+(2*pi-temp_j)/dtr,360)];
end
weidu=w;
jingdu=j;
for t=1:length(jingdu)
    jingdu_r=[jingdu_r,mod(2*jingdu(1)-jingdu(t)+360,360)];
end

% w=40.73;%γ��
% j=360-73.91;%���ȣ�0-360��

w=39.91;
j=116.38; 

jd=0;%�����ǵ��ͬγ�����µ�켣��ľ��Ȳ�ֵ
jd_r=0;
for i=1:length(weidu)
    if w>weidu(i)
        jd=jingdu(i)
        break
    end
end
for i=1:length(weidu)
    if w>weidu(i)
        jd_r=jingdu_r(i);
        break
    end
end
cell={};%�����������
juedui_row=[];
for kk=0:k
    delt=360/((N-m)*N^kk)%���ĺ�����ÿ����С����ľ��Ȳ�
    if j<jd
        col=floor((j-jd+360)/delt)
    else
        col=floor((j-jd)/delt)
    end
    temp=floor((j-jd_r)/delt);
    row=mod(col-temp,(N-m)*N^kk);
    juedui_row=[juedui_row,row];
    if kk~=0
        row=row-(juedui_row(kk)-1)*N^(kk)-1;
    end
    cell{kk+1}=[row,mod(col,N)];
end
%���k+1�У�����0-k����������
for i=0:k
    disp(cell{i+1})
end

