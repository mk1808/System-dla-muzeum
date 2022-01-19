export interface Exhibit {
    id?: number;
    name?: string;
    number?: string;
    description?: string;
    room?: Room|Object;
    photo?: string;
}

export interface AppUser {
    id: number;
    name: string;
    mail: string;
    surname: string;
}

export interface Room {
    id: number;
    name: string;
}

export interface Point {
    id: number;
    exhibit: Exhibit;
    x: number;
    y: number;
    z: number;
}

export interface Login {
    mail: string;
    password: string;
}


export interface File {
    id: number;
    name: string;
}