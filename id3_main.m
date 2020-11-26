%%%%%%%%%%%%%%%%%%%%%         id3�㷨��ѵ�������    %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%     id3_main.m   %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%    data:2020��6��14��    author:SA19006004�¹���  %%%%%%%%%%

%%%%%����˵��
%%%��UCI��DNA���ݼ��£���id3�㷨����ѵ�������
%%%����data_test_nondecision.m������ѵ�����ݼ���������ݼ��о�û�С���ͬ���ԣ���ͬ��𡱵�����

%%%%%%ʵ�黷��
%�����汾��MATLAB R2019a

%************************* �������� ************************%
clear;
clc;

%%%%%%%%%%%%%%%%%%%%%%%  �����趨   %%%%%%%%%%%%%%%%%%%%
delta= 0.1;  %��Ϣ��������ֵ 

%%%%%%%%%%%%%%%%%%%%%%%  ���ݼ�ѵ����������   %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%����Ԥ����
%%%data_train��ѵ�����ݼ�������*��������+�������
%%%attributes_label��cell���ͣ�����
[data_train,attributes_label] =  id3_preprocess(1);
[length_trainx,length_trainy] = size(data_train);
data_1 = data_train(:,1:length_trainy-1);
%%%decision:ѵ��������*�о����
decision = data_train(:,length_trainy);

%%%%%%%%%ѵ��������
decisionTreeModel=decisionTree(data_1,decision,attributes_label,delta);

%%%%%%%%%%%%%%%%%%%%%%% ѵ���õľ�����ȥ����   %%%%%%%%%%%%%%%%%%%%
[data_test,~] =  id3_preprocess(2);
[length_testx,length_testy] = size(data_test);
data_2 = data_test(:,1:length_testy-1);
expect_result = data_test(:,length_testy);

%%%%%%%%%%%%%%%%%%%%%%% ���Խ��   %%%%%%%%%%%%%%%%%%%%
data_result = decisionTreeTest(decisionTreeModel,data_2,attributes_label);
right_location = (expect_result == data_result);
right_number = sum (right_location);
right_rate = right_number/length_testx

aaa = 1;

%%%%%%%%%%%%%%%%�������ݼ�������Ϊ1186
%%%%%%%%%%%%%%%%delta = 0.001ʱ��
%%%%������Ϣ�����������ѡ�������ʱ����ȷ����������Ϊ1061����ȷ����0.894603709949410
%%%%������Ϣ�����������ʱ��ѡ�������ʱ����ȷ����������Ϊ1068����ȷ����0.900505902192243

%%%%%%%%%%%%%%%%delta = 0.01ʱ��
%%%%������Ϣ�����������ѡ�������ʱ����ȷ����������Ϊ1061����ȷ����0.894603709949410
%%%%������Ϣ�����������ʱ��ѡ�������ʱ����ȷ����������Ϊ1068����ȷ����0.900505902192243

%%%%%%%%%%%%%%%%delta = 0.05ʱ��
%%%%������Ϣ�����������ѡ�������ʱ����ȷ����������Ϊ1068����ȷ����0.900505902192243
%%%%������Ϣ�����������ʱ��ѡ�������ʱ����ȷ����������Ϊ1080����ȷ����0.910623946037100

%%%%%%%%%%%%%%%%delta = 0.1ʱ��
%%%%������Ϣ�����������ѡ�������ʱ����ȷ����������Ϊ1077����ȷ����0.908094435075885
%%%%������Ϣ�����������ʱ��ѡ�������ʱ����ȷ����������Ϊ1059����ȷ����0.892917369308600

%%%%%%%%%%%%%%%%delta = 0.15ʱ��
%%%%������Ϣ�����������ѡ�������ʱ����ȷ����������Ϊ1070����ȷ����0.902192242833052
%%%%������Ϣ�����������ʱ��ѡ�������ʱ����ȷ����������Ϊ1000����ȷ����0.843170320404722

%%%%%%%%%%%%%%%%delta = 0.2ʱ��
%%%%������Ϣ�����������ѡ�������ʱ����ȷ����������Ϊ1043����ȷ����0.879426644182125
%%%%������Ϣ�����������ʱ��ѡ�������ʱ����ȷ����������Ϊ1002����ȷ����0.844856661045531

delta_3 = [0.001,0.01,0.05,0.1,0.15,0.2];
rate1 = [0.894603709949410 0.894603709949410 0.900505902192243 0.908094435075885 0.902192242833052 0.879426644182125];
rate2 = [0.900505902192243 0.900505902192243 0.910623946037100 0.892917369308600 0.843170320404722 0.844856661045531];
figure(1);
plot(delta_3,rate1,'-+');
hold on;
grid on;
plot(delta_3,rate2,'-*');
xlabel('deltaֵ');
ylabel('��ȷ��');
title('�������ݼ�������ȷ����deltaֵ�仯ͼ');
legend('������Ϣ���������ѡ���������','������Ϣ�����������ѡ���������');


%%%%%%%%%%%%%%%%%%%%%%% ʵ�����   %%%%%%%%%%%%%%%%%%%%
%%%%�趨��ͬ��deltaֵ����ѡ��������Ծ���Ӱ�죬����Ӱ��������ݵķ�����ȷ��
%%%%��delta=0.1ʱ��������Ϣ�����������ѡ������ԣ���ȷ����0.908094435075885
%%%%��delta=0.05ʱ����������Ϣ�������������ѡ������ԣ���ȷ����0.910623946037100