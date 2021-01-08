% ����

clear

% �캽��״̬��Q0
% �캽���ٶȣ�V0
% �캽�߼��ٶȣ�A0
% �����߹���λ�ã�P_EsX��P_EsY


Q0 = [0 0]';
V0 = [0 0]';
A0 = [0 0]';

P_EsX_t0 = [pi/7*1, pi/7*2, pi/7*3, pi/7*4];
P_EsY_t0 = [pi/8*1, pi/8*2, pi/8*3, pi/8*4];


% ʱ�����
tBegin = 0;
tEnd   = 10;
dT     = 0.1;


[T, P_EsX] = ode45(@Differ, [tBegin,tEnd], P_EsX_t0);
[TY,P_EsY] = ode45(@DifferY,[tBegin,tEnd], P_EsY_t0);

% ���ƽ��ͼ
figure(1)

subplot(2,1,1)
plot(T,P_EsX(:,1), T,P_EsX(:,2), T,P_EsX(:,3), T,P_EsX(:,4)); 
legend('�˶���1','�˶���2', '�˶���3','�˶���4'); title('��е���˶��켣'); grid on

subplot(2,1,2)
plot(TY,P_EsY(:,1), TY,P_EsY(:,2), TY,P_EsY(:,3), TY,P_EsY(:,4)); 
legend('�˶���1','�˶���2', '�˶���3','�˶���4'); title('��е���˶��켣'); grid on


% ΢�ַ���
function P_EsX_Dot = Differ(t,P_EsX)
    % ϵ��
    alpha = [1.5 1.5 1.5 1.5]';
    % ������֮���ϵ����
    L = [0  0  0  0;
        -1  1  0  0;
         0 -1  1  0;
         0  0 -1  1;];
    % ���캽�߹�ϵ����
    B = [1;
         0;
         0;
         0;];
     
    P_EsX_Dot = -alpha .* sign( L*P_EsX + B.*(P_EsX-sin(t)) );
end
% ΢�ַ���
function P_EsY_Dot = DifferY(t,P_EsY)
    % ϵ��
    alpha = [1.5 1.5 1.5 1.5]';
    % ������֮���ϵ����
    L = [0  0  0  0;
        -1  1  0  0;
         0 -1  1  0;
         0  0 -1  1;];
    % ���캽�߹�ϵ����
    B = [1;
         0;
         0;
         0;];
     
    P_EsY_Dot = -alpha .* sign( L*P_EsY + B.*(P_EsY+sin(t)) );
end




