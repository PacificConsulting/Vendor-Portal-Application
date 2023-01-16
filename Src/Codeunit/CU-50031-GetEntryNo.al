codeunit 50031 "Get Entry No"
{
    Permissions = TableData "Portal Vend Updated Purch Rec" = rimd;

    trigger OnRun()
    begin
    end;

    var
        RecPurchPayable: Record 312;

    [Scope('Internal')]
    procedure GetEntryNo(): Integer
    var
        PortalVendUpdatedPurchRec: Record "Portal Vend Updated Purch Rec";
        EntryNo: Integer;
    begin
        PortalVendUpdatedPurchRec.RESET;
        IF PortalVendUpdatedPurchRec.FINDLAST THEN
            EntryNo := PortalVendUpdatedPurchRec."Entry No"
        ELSE
            EntryNo := 0;
        EXIT(EntryNo);
    end;

    [Scope('Internal')]
    procedure GetQuotationNo(): Code[30]
    var
        QuotationNo: Code[30];
        PortalVendUpdatedPurchRec1: Record "Portal Vend Updated Purch Rec";
        Noserias: Record 308;
        LineNoSerias: Record 309;
        NoSsriesManagent: Codeunit 396;
    begin
        RecPurchPayable.GET;
        QuotationNo := NoSsriesManagent.GetNextNo(RecPurchPayable."Order Nos."/*"Quotation No"*/, WORKDATE, TRUE); //PCPL-0070
        EXIT(QuotationNo);
    end;
}

