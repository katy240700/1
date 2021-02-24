unit Unit2;

interface
  procedure Calc(x,eps:Real; var y,s:Real; var n:Word);
implementation
  procedure Calc(x,eps:Real; var y,s:Real; var n:Word);
  //��������� ���������� ����� ���� ��� �������� �������
  //�-��������, eps-����������� ����������;
  //y-�������, s-�����, n-����� ���������� ����������
  var
    t,f:Real;  //������������ ����� ����������, ���������
  begin
   //���������� �������� ������� �� ������������� �������
   y:=(1-x*x/2)*cos(x)-x/2*sin(x);
   //���������� �������� ������� �� �� ��������� � ���
   n:=0; //��������� ����� ����������
   t:=1; //��������� �������� ������������ ����� ����������
   f:=t; //��������� �������� ����� ����������
   s:=f; //��������� �������� �����
   repeat //��������� ����������
     Inc(n);  //����� ���������� ����������
     t:=-t*x*x/((2*n-1)*2*n); //�������� ������������ ����� ����������
     f:=t*(2*n*n+1); //�������� ���������� ����������
     s:=s+f; //��������� �������� �����
   until (abs(f)<eps)or(n>100); //���� ������ ���������� �� ������ ������ eps
                                //��� �� ����� ��������� 100 ���������
end;  //procedure Calc
end. //unit2

end.
 