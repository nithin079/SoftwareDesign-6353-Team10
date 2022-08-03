import { Role } from './role';

export class Account {
    Id: number;
    UserName: string;
    FullName: string;
    Address1: string;
    Address2: string;
    City: string;
    State: string;
    Zipcode: string;
    Role: Role;
    jwtToken?: string;
}