unit _3_Auth_IM_Client_RequestAddFriendFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,

  CoreClasses,
  PascalStrings,
  UnicodeMixedLib,
  DoStatusIO,
  NotifyObjectBase,
  CommunicationFramework,
  PhysicsIO,
  DTC40;

type
  T_3_Auth_IM_Client_RequestAddFriendForm = class(TForm)
    ToUserNameEdit: TLabeledEdit;
    Memo: TMemo;
    sendRequeseButton: TButton;
    CancelButton: TButton;
    Label1: TLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sendRequeseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _3_Auth_IM_Client_RequestAddFriendForm: T_3_Auth_IM_Client_RequestAddFriendForm;

implementation

{$R *.dfm}

uses _3_Auth_IM_Client_Frm;

procedure T_3_Auth_IM_Client_RequestAddFriendForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure T_3_Auth_IM_Client_RequestAddFriendForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caHide;
end;

procedure T_3_Auth_IM_Client_RequestAddFriendForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
      Close;
end;

procedure T_3_Auth_IM_Client_RequestAddFriendForm.sendRequeseButtonClick(Sender: TObject);
begin
  DTC40.DTC40_ClientPool.WaitConnectedDoneP('MyVA', procedure(States_: TDTC40_Custom_ClientPool_Wait_States)
    var
      cli: TMyVA_Client;
    begin
      cli := States_[0].Client_ as TMyVA_Client;
      cli.RequestFriend(ToUserNameEdit.Text, Memo.Text);
    end)
end;

end.
