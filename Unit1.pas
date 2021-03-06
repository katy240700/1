unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    lbFun: TLabel;
    lbSum: TLabel;
    pnFun: TPanel;
    pnSum: TPanel;
    Bevel1: TBevel;
    imFun: TImage;
    imSum: TImage;
    lbArg: TLabel;
    edArg: TEdit;
    rgEps: TRadioGroup;
    Bevel2: TBevel;
    Bevel3: TBevel;
    bbtCalc: TBitBtn;
    lbFunRes: TLabel;
    lbSumRes: TLabel;
    lbNum: TLabel;
    bbtClose: TBitBtn;
    procedure bbtCalcClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.dfm}

//������������ ������ 11
//��������� ���������� "���������� ����"
//��������� ������� ���������, ��. ���18-11

procedure TForm1.bbtCalcClick(Sender: TObject);
var
  x,eps,y,s:Real; //��������, �����������, �������, �����
  n:Word; //����� ���������� ����������
begin
  try
    x:=StrToFloat(edArg.Text);
    case rgEps.ItemIndex of //�������� ������ �������� � ������ �����������
      0:eps:=1e-3;
      1:eps:=1e-4;
      2:eps:=1e-5;
      else raise Exception.Create('�� ������� �������� �����������!');
    end;
    Calc(x,eps,y,s,n);
    lbFunRes.Caption:='������� '+FloatToStrF(y,ffFixed,12,5);
    lbSumRes.Caption:='����� ���� '+FloatToStrF(s,ffFixed,12,5);
    lbNum.Caption:='����� ���������� ���������� '+IntToStr(n);
  except
   on EConvertError do ShowMessage('�������� �� ������'#13#10+'��� ������ � �������!');
   on E:Exception do ShowMessage(E.Message);
  end;
end;

end.
