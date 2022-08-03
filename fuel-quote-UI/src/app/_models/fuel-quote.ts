export interface FuelQuote {
    FuelId: number;
    ClientId: number;
    GallonsRequested: number;
    DiliveryAddress: string;
    DeliveryDate: Date;
    SuggestedPrice: number;
    TotalAmountDue: number;
    ClientName:string ;
}