export interface DialogInput {
    type: 'text' | 'number',
    placeholder: string
};

export interface ModalOptions {
    title: string;
    submitTitle: string;
    closeTitle?: string;
    input?: DialogInput;
    action: (type: 'submit' | 'close', value: string) => void;
};

export interface Items {
    [key:string]:string
};

export type ModalVal = {
    open: false;
} | ({
    open: true;
} & ModalOptions);

export type ModalAssign = (options: ModalOptions) => void;

export type Mode = 0 | 1;