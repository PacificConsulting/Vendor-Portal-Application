page 50108 "Specification Sub-Form"
{
    AutoSplitKey = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = 50066;
    SourceTableView = SORTING("Specs ID", "Line No.")
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Enabled = Editbool;
                IndentationColumn = QltyIndent;
                IndentationControls = Description;
                field("Account Type"; Rec."Account Type")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        NameEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
                        MinMaxeditable := Rec."Account Type" = Rec."Account Type"::Posting;
                        IF Rec."Account Type" = Rec."Account Type"::Posting THEN
                            QltyIndent := 1
                        ELSE
                            QltyIndent := 0;
                    end;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Group Code"; Rec."Group Code")
                {
                    ApplicationArea = All;
                }
                field("Qlty Measure Code"; Rec."Qlty Measure Code")
                {
                    ApplicationArea = All;
                    Editable = MinMaxeditable;
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                }
                field("Test Manadatory"; Rec."Test Manadatory")
                {
                    ApplicationArea = All;
                    Editable = MinMaxeditable;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    Editable = MinMaxeditable;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                }
                field("Protocol No."; Rec."Protocol No.")
                {
                    ApplicationArea = All;
                }
                field("Text Value"; Rec."Text Value")
                {
                    ApplicationArea = All;
                    Editable = MinMaxeditable;
                }
                field("Additional Text Value"; Rec."Additional Text Value")
                {
                    ApplicationArea = All;
                }
                field("Additional Text Value 2"; Rec."Additional Text Value 2")
                {
                    ApplicationArea = All;
                }
                field("Additional Text Value 3"; Rec."Additional Text Value 3")
                {
                    ApplicationArea = All;
                }
                field(Qualitative; Rec.Qualitative)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Retest; Rec.Retest)
                {
                    ApplicationArea = All;
                }
                field("Test Method"; Rec."Test Method")
                {
                    ApplicationArea = All;
                }
                field("Laboratory Details"; Rec."Laboratory Details")
                {
                    ApplicationArea = All;
                }
                field("Min. Value"; Rec."Min. Value")
                {
                    ApplicationArea = All;
                    Editable = MinMaxeditable;
                }
                field("Max. Value"; Rec."Max. Value")
                {
                    ApplicationArea = All;
                    Editable = MinMaxeditable;
                }
                field("Mean Tolerance"; Rec."Mean Tolerance")
                {
                    ApplicationArea = All;
                    Editable = MinMaxeditable;
                }
                field("Parent Group Code"; Rec."Parent Group Code")
                {
                    ApplicationArea = All;
                }
                field("Specs ID"; Rec."Specs ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Edit Protocol")
            {
                Image = Edit;
                Promoted = true;
                PromotedCategory = Process;
                ShortCutKey = 'F6';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    /* PCPL-0070 <<
                    recUserSetup.RESET;
                    recUserSetup.SETRANGE(recUserSetup."QC Approver", USERID);
                   
                    IF NOT recUserSetup.FINDFIRST THEN
                        ERROR('You do not have the rights to edit Protocol');
                    TESTFIELD("Account Type", "Account Type"::Posting);
                    recProtocol.RESET;
                    recProtocol.SETRANGE(recProtocol."Specs ID", "Specs ID");
                    recProtocol.SETRANGE(recProtocol."Version Code", "Version Code");
                    recProtocol.SETRANGE(recProtocol."Line No.", "Line No.");
                    recProtocol.SETRANGE(recProtocol."Protocol No.", "Protocol No.");
                    IF NOT recProtocol.FINDFIRST THEN BEGIN
                        recProtocol.INIT;
                        recProtocol."Specs ID" := "Specs ID";
                        recProtocol."Version Code" := "Version Code";
                        recProtocol."Line No." := "Line No.";
                        recProtocol."Protocol No." := getProtocolNo;
                        recProtocol."Protocol Creation Date" := WORKDATE;
                        recProtocol."Protocol Created By" := USERID;
                        recProtocol.INSERT;
                        ProtocolTextMgt.EditContactText(recProtocol, FALSE);
                        "Protocol No." := recProtocol."Protocol No.";
                        MODIFY;
                    END
                    ELSE
                        ProtocolTextMgt.EditContactText(recProtocol, FALSE);
                        */ //PCPL-0070 >>
                end;
            }
            action("Preview Protocol")
            {
                Image = PreviewChecks;
                Promoted = true;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.TESTFIELD("Account Type", Rec."Account Type"::Posting);
                    /* PCPL-0070 <<
                    recProtocol.RESET;
                    recProtocol.SETRANGE(recProtocol."Specs ID", "Specs ID");
                    recProtocol.SETRANGE(recProtocol."Version Code", "Version Code");
                    recProtocol.SETRANGE(recProtocol."Line No.", "Line No.");
                    recProtocol.SETRANGE(recProtocol."Protocol No.", "Protocol No.");
                    IF recProtocol.FINDFIRST THEN BEGIN
                        ProtocolTextMgt.EditContactText(recProtocol, TRUE);
                    END
                    ELSE
                        ERROR('No protocol is defined'); */ //PCPL-0070 >>
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        Editbool := TRUE;
        IF SpecificationHeader.GET(Rec."Specs ID") THEN
            IF SpecificationHeader.Status = SpecificationHeader.Status::Certified THEN
                Editbool := FALSE;
    end;

    trigger OnAfterGetRecord()
    begin
        NameEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
        MinMaxeditable := Rec."Account Type" = Rec."Account Type"::Posting;
        IF Rec."Account Type" = Rec."Account Type"::Posting THEN
            QltyIndent := 1
        ELSE
            QltyIndent := 0;
        Editbool := TRUE;
        IF SpecificationHeader.GET(Rec."Specs ID") THEN
            IF SpecificationHeader.Status = SpecificationHeader.Status::Certified THEN
                Editbool := FALSE;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        NameEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
        MinMaxeditable := Rec."Account Type" = Rec."Account Type"::Posting;
        IF Rec."Account Type" = Rec."Account Type"::Posting THEN
            QltyIndent := 1
        ELSE
            QltyIndent := 0;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        NameEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
        MinMaxeditable := Rec."Account Type" = Rec."Account Type"::Posting;
        IF Rec."Account Type" = Rec."Account Type"::Posting THEN
            QltyIndent := 1
        ELSE
            QltyIndent := 0;
    end;

    trigger OnOpenPage()
    begin
        NameEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
        MinMaxeditable := Rec."Account Type" = Rec."Account Type"::Posting;
        IF Rec."Account Type" = Rec."Account Type"::Posting THEN
            QltyIndent := 1
        ELSE
            QltyIndent := 0;
        Editbool := FALSE;
    end;

    var
        ProdBOMHeader: Record 99000771;
        ProdBOMWhereUsed: Page 99000811;
        ProductionBOMCopy: Codeunit 99000768;
        VersionMgt: Codeunit 99000756;
        ActiveVersionCode: Code[20];
        [InDataSet]
        "Min. ValueEditable": Boolean;
        [InDataSet]
        "Max. ValueEditable": Boolean;
        [InDataSet]
        "Mean ToleranceEditable": Boolean;
        QltyIndent: Integer;
        NameEmphasize: Boolean;
        MinMaxeditable: Boolean;
        // recProtocol: Record "50025";
        // ProtocolTextMgt: Codeunit "50007";
        recUserSetup: Record 91;
        SpecificationHeader: Record 50067;
        Editbool: Boolean;

    [Scope('Internal')]
    procedure getProtocolNo() ProtocolNo: Integer
    var
    //tempProtocolTxt: Record "50026";
    begin
        /* PCPL-0070
         tempProtocolTxt.RESET;
         IF tempProtocolTxt.FINDLAST THEN
             EXIT(tempProtocolTxt."Protocol No." + 1)
         ELSE
             EXIT(1);
             */ //PCPL-0070 >>
    end;
}

