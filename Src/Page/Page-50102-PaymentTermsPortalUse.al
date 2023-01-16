page 50102 "Payment Terms PortalUse"
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

