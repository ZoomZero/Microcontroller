//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <ComCtrls.hpp>
#include <Menus.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TOpenDialog *OpenDialog1;
        TComboBox *FtComboBox;
        TComboBox *FTSpeed;
        TLabel *Label1;
        TEdit *Edit1;
        TButton *Button2;
        TRichEdit *RichEdit1;
        TButton *Button3;
        TButton *Button4;
        TButton *Button5;
        TButton *Button6;
        TButton *Button7;
        TUpDown *UpDown1;
        TEdit *Edit2;
        TCheckBox *CheckBox1;
        TMainMenu *MainMenu1;
        TMenuItem *N1;
        TMenuItem *N2;
        TMenuItem *N3;
        TMenuItem *N4;
        TMenuItem *N5;
        TEdit *Edit3;
        TEdit *Edit4;
        TProgressBar *ProgressBar1;
        TTimer *Timer1;
        TEdit *Edit5;
        TButton *Button8;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormActivate(TObject *Sender);
        void __fastcall FtComboBoxDropDown(TObject *Sender);
        void __fastcall FtComboBoxChange(TObject *Sender);
        void __fastcall FTSpeedDropDown(TObject *Sender);
        void __fastcall FTSpeedChange(TObject *Sender);
        void __fastcall Label1DblClick(TObject *Sender);
        void __fastcall Edit1DblClick(TObject *Sender);
        void __fastcall Edit1KeyPress(TObject *Sender, char &Key);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall Button3Click(TObject *Sender);
        void __fastcall Button4Click(TObject *Sender);
        void __fastcall Button5Click(TObject *Sender);
        void __fastcall Button6Click(TObject *Sender);
        void __fastcall Button7Click(TObject *Sender);
        void __fastcall Edit2Change(TObject *Sender);
        void __fastcall Edit3DblClick(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall Button8Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
