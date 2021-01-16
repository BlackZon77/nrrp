-- TriggerEvent('esx_policedog:openMenu') to open menu

Config = {
    Job = 'police',
    Command = 'k9', -- set to false if you dont want to have a command
    Model = 1126154828,
    TpDistance = 50.0,
    Sit = {
        dict = 'creatures@rottweiler@amb@world_dog_sitting@base',
        anim = 'base'
    },
    Drugs = {
        'coke1g', 'coke10g', 'cokebrick',
        'meth1g', 'meth10g', 'methbrick',
        'joint2g', 'weed4g', 'weed20g', 'weedbrick'
    },

}

Strings = {
    ['menu_title'] = 'K9 Polícia',
    ['take_out_remove'] = 'Spawn/Dispawn K9',
    ['sit_stand'] = 'Mandar sentar/levantar',
    ['search_drugs'] = 'Mandar cheirar a pessoa mais proxima',
    ['attack_closest'] = 'Atacar a pessoa mais proxima',
    ['get_in_out'] = 'Tirar/Colocar na carrinha'
}