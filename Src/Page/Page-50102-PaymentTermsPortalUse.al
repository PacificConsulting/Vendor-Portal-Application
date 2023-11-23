page 50120 "Payment Terms PortalUse"
{
    PageType = List;
    SourceTable = "Payment Terms PortalUse";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    TableRelation = "Payment Terms".Code;
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        recpayment.RESET;
                        recpayment.SETRANGE(recpayment.Code, Rec.Code);
                        IF recpayment.FINDFIRST THEN BEGIN
                            Rec.Descripion := recpayment.Description;
                        END;
                    end;
                }
                field(Descripion; Rec.Descripion)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    var
        recpayment: Record 3;
}

