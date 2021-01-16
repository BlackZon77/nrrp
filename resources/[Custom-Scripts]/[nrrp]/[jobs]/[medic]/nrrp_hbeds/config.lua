Config = {
    Price = 150,
    ReviveTime = 200, -- seconds until you are revived
    Hospitals = {
        {
            Bed = {coords = vector3(-454.88, -278.34, 34.2), heading = 66.88, occupied = false},
            Peds = {
                pedHash = -730659924,
                reception = {coords = vector3(-435.13, -323.97, 33.91), heading = 159.28},
                doctor = {coords = vector3(-454, -278.14, 34.2), heading = 161.28},
            },
        },
		{
            Bed = {coords = vector3(-260.22, 6324.14, 33.35), heading = 66.88, occupied = false},
            Peds = {
                pedHash = -730659924,
                reception = {coords = vector3(-252.08, 6335.52, 31.43), heading = 159.28},
                doctor = {coords = vector3(-260.71, 6325.01, 31.43), heading = 161.28},
            },
        },
    },
}

Strings = {
    ['get_help'] = [[Pressiona %s para obter ajuda por ~g~%s €]],
    ['not_enough'] = [[Não tens dinheiro suficiente!]],
    ['getting_help'] = [[Estás a ter ajuda, %s segundos restantes!]],
    ['occupied'] = [[A cama está ocupada! Volta mais tarde]]
}