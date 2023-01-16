page 50107 "Vendor Catalog"
{
    PageType = List;
    SourceTable = "Item Vendor Catalog";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field("Send Mail"; Rec."Send Mail")
                {
                }
                field("Vendor Type"; Rec."Vendor Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

