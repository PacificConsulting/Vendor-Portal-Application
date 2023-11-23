page 50106 "Specification Header"
{
    PageType = ListPlus;
    SourceTable = "Specification Header";
    SourceTableView = SORTING("Specs ID")
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Specs ID"; Rec."Specs ID")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Version Nos."; Rec."Version Nos.")
                {
                    ApplicationArea = All;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                }
                field("Active Version"; activeVersion)
                {
                    ApplicationArea = All;
                    Caption = 'Active Version';
                    Editable = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /* //PCPL-0070 <<
                          recVersionHdr.RESET;
                          recVersionHdr.FILTERGROUP(2);
                          recVersionHdr.SETRANGE(recVersionHdr."Specs ID", "Specs ID");
                          recVersionHdr.SETRANGE(recVersionHdr."Version Code", activeVersion);
                          recVersionHdr.FILTERGROUP(0);
                          CLEAR(pgVersion);
                          pgVersion.SETTABLEVIEW(recVersionHdr);
                          pgVersion.RUN;
                          */ //PCPL-0070 >>
                    end;
                }
            }
            // part(specsline; 50042)
            // {
            //     SubPageLink = "Specs ID"=FIELD("Specs ID"),
            //                   "Version Code"=CONST();
            //     SubPageView = SORTING("Specs ID","Line No.")
            //                   ORDER(Ascending);
            // }
        }
    }

    actions
    {
        area(processing)
        {
            action(Version)
            {
                Image = Versions;
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Page 50043;
                //RunPageLink = "Specs ID"=FIELD("Specs ID"); //PCPL-0070 
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.TESTFIELD(Status, Rec.Status::Certified);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IF Rec.Status = Rec.Status::Certified THEN
            editSubForm := FALSE
        ELSE
            editSubForm := TRUE;

        activeVersion := Rec.GetVersion(Rec."Specs ID");
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        IF Rec.Status = Rec.Status::Certified THEN
            editSubForm := FALSE
        ELSE
            editSubForm := TRUE;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        IF Rec.Status = Rec.Status::Certified THEN
            editSubForm := FALSE
        ELSE
            editSubForm := TRUE;
        Rec."Last Date Modified" := WORKDATE;
    end;

    trigger OnOpenPage()
    begin
        IF Rec.Status = Rec.Status::Certified THEN
            editSubForm := FALSE
        ELSE
            editSubForm := TRUE;
    end;

    var
        editSubForm: Boolean;
        activeVersion: Code[50];
    /* PCPL-0070 <<
    recVersionHdr: Record "50017";
    pgVersion: Page "50043";
                   pgVersionSpecs: Page "50043"; */ //PCPL-0070 >>
}

