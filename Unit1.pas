unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, assimp,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Math.Vectors, FMX.Controls3D,
  FMX.Objects3D, FMX.Viewport3D, FMX.Types3D;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Viewport3D1: TViewport3D;
    Model3D1: TModel3D;
    Camera1: TCamera;
    Light1: TLight;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.IOUtils;

procedure TForm1.Button1Click(Sender: TObject);
begin
var A := aiImportFile(PAnsiChar(AnsiString(TPath.Combine(ExtractFilePath(ParamStr(0)),'RotatingCube.3DS'))),0);
Caption := PAnsiChar(aiGetErrorString);
aiExportScene(A, PAnsiChar(AnsiString('obj')), PAnsiChar(AnsiString(TPath.Combine(ExtractFilePath(ParamStr(0)),'RotatingCube.obj'))), 0);
Caption := PAnsiChar(aiGetErrorString);
//showmessage(A.mNumMeshes.ToString);
aiReleaseImport(A);

Model3D1.LoadFromFile(TPath.Combine(ExtractFilePath(ParamStr(0)),'RotatingCube.obj'));
end;

end.
