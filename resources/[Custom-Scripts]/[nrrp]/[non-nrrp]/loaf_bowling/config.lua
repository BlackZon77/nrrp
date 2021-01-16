--[[
    Made by @Loaf Scripts#7785
    Other scripts by me: https://gta5-store.com/store/loaf
    This script REQUIRES the bowling map made by Breze, https://gta5-store.com/shop/mlo-bowling-hall
    You are *not* allowed to resell/trade/give away this script
]]

Config = {
    ['Bowling'] = {
        ['GetBall'] = vector3(-141.83, -252.71, 44.0),
        ['Cam'] = {
            ['Start'] = vector3(-153.88, -249.44, 46.80),
            ['End'] = vector3(-160.21, -267.3, 43.16),
            ['Fov'] = 80.0
        },
        ['Heading'] = {150.0, 170.0}, -- min heading, max heading
        ['Tracks'] = {
            vector4(-146.25, -260.86, 43.16, 158.0),
            vector4(-149.21, -259.63, 43.16, 158.0),
            vector4(-151.88, -258.71, 43.16, 158.0),
            vector4(-154.84, -257.7, 43.16, 158.0),
            vector4(-158.68, -256.34, 43.16, 158.0),
            vector4(-161.6, -255.3, 43.16, 158.0),
            vector4(-164.28, -254.32, 43.16, 158.0),
            vector4(-167.2, -253.3, 43.16, 158.0)
        },
        ['BowlingPinSets'] = {
            {
                vector3(-152.1756, -278.0237, 43.24929),
                vector3(-152.1174, -278.2685, 43.24929),
                vector3(-152.3687, -278.1628, 43.24929),
                vector3(-152.3105, -278.3871, 43.24929),
                vector3(-152.558, -278.2952, 43.24929),
                vector3(-152.0571, -278.479, 43.24929),
                vector3(-151.9918, -278.7413, 43.24929),
                vector3(-152.2504, -278.6514, 43.24929),
                vector3(-152.5192, -278.565, 43.24929),
                vector3(-152.7647, -278.4796, 43.24929)
            },
            
            {
                vector3(-155.1486, -276.8353, 43.24929),
                vector3(-155.0905, -277.0801, 43.24929),
                vector3(-155.3417, -276.9744, 43.24929),
                vector3(-155.2835, -277.1987, 43.24929),
                vector3(-155.531, -277.1068, 43.24929),
                vector3(-155.0301, -277.2906, 43.24929),
                vector3(-154.9648, -277.5529, 43.24929),
                vector3(-155.2234, -277.463, 43.24929),
                vector3(-155.4922, -277.3766, 43.24929),
                vector3(-155.7377, -277.2912, 43.24929)
            },

            {
                vector3(-157.7556, -275.7554, 43.24929),
                vector3(-157.6975, -276.0002, 43.24929),
                vector3(-157.9488, -275.8944, 43.24929),
                vector3(-157.8906, -276.1187, 43.24929),
                vector3(-158.138, -276.0268, 43.24929),
                vector3(-157.6372, -276.2107, 43.24929),
                vector3(-157.5719, -276.473, 43.24929),
                vector3(-157.8305, -276.3831, 43.24929),
                vector3(-158.0992, -276.2967, 43.24929),
                vector3(-158.3448, -276.2113, 43.24929)
            },

            {
                vector3(-160.5427, -274.0963, 43.24881),
                vector3(-160.4901, -274.4021, 43.24881),
                vector3(-160.7729, -274.2939, 43.24881),
                vector3(-160.9759, -274.4997, 43.24881),
                vector3(-160.7207, -274.5862, 43.24881),
                vector3(-160.5059, -274.6621, 43.24881),
                vector3(-160.4403, -274.8927, 43.24881),
                vector3(-160.6632, -274.8186, 43.24881),
                vector3(-160.895, -274.7328, 43.24881),
                vector3(-161.1401, -274.643, 43.24881)
            },

            {
                vector3(-164.3882, -272.7944, 43.24929),
                vector3(-164.3301, -273.0392, 43.24929),
                vector3(-164.5814, -272.9335, 43.24929),
                vector3(-164.5231, -273.1578, 43.24929),
                vector3(-164.7706, -273.0659, 43.24929),
                vector3(-164.2697, -273.2498, 43.24929),
                vector3(-164.2045, -273.5121, 43.24929),
                vector3(-164.463, -273.4221, 43.24929),
                vector3(-164.7318, -273.3358, 43.24929),
                vector3(-164.9773, -273.2504, 43.24929),
            },

            {
                vector3(-167.3406, -271.7319, 43.24929),
                vector3(-167.2825, -271.9767, 43.24929),
                vector3(-167.5338, -271.8709, 43.24929),
                vector3(-167.4755, -272.0952, 43.24929),
                vector3(-167.723, -272.0033, 43.24929),
                vector3(-167.2221, -272.1872, 43.24929),
                vector3(-167.1569, -272.4495, 43.24929),
                vector3(-167.4154, -272.3596, 43.24929),
                vector3(-167.6842, -272.2732, 43.24929),
                vector3(-167.9297, -272.1878, 43.24929)
            },

            {
                vector3(-169.938, -270.6638, 43.24929),
                vector3(-169.8799, -270.9086, 43.24929),
                vector3(-170.1311, -270.8029, 43.24929),
                vector3(-170.0729, -271.0272, 43.24929),
                vector3(-170.3204, -270.9353, 43.24929),
                vector3(-169.8195, -271.1191, 43.24929),
                vector3(-169.7543, -271.3814, 43.24929),
                vector3(-170.0128, -271.2915, 43.24929),
                vector3(-170.2816, -271.2051, 43.24929),
                vector3(-170.5271, -271.1198, 43.24929)
            },

            {
                vector3(-172.7789, -269.1845, 43.24929),
                vector3(-172.7208, -269.4294, 43.24929),
                vector3(-172.9721, -269.3236, 43.24929),
                vector3(-172.9139, -269.5479, 43.24929),
                vector3(-173.1613, -269.456, 43.24929),
                vector3(-172.6605, -269.6399, 43.24929),
                vector3(-172.5952, -269.9022, 43.24929),
                vector3(-172.8538, -269.8123, 43.24929),
                vector3(-173.1225, -269.7259, 43.24929),
                vector3(-173.3681, -269.6405, 43.24929)
            }
        },

        ['BowlingBalls'] = {
            vector3(-141.0396, -252.3092, 43.82756),
            vector3(-141.1883, -252.7568, 43.82756),
            vector3(-141.2772, -253.1083, 43.82756),
            vector3(-141.4393, -253.4855, 43.82756),
            vector3(-141.4393, -253.4855, 43.5381),
            vector3(-141.2557, -253.0987, 43.5381),
            vector3(-141.1771, -252.7275, 43.5381),
            vector3(-141.0329, -252.2919, 43.5381),
            vector3(-141.0329, -252.2919, 43.22288),
            vector3(-141.1889, -252.734, 43.22288),
            vector3(-141.33, -253.1166, 43.22288),
            vector3(-141.4617, -253.4859, 43.22288)
        },
    },
}

Strings = {
    ['press_start'] = '~INPUT_PICKUP~: para pegar uma bola de bowling',
    ['next_last_select'] = '~INPUT_CELLPHONE_RIGHT~ ~INPUT_CELLPHONE_LEFT~ Navegar\n~INPUT_FRONTEND_ENDSCREEN_ACCEPT~ Escolher\n~INPUT_FRONTEND_RRIGHT~ Cancelar',
    ['bowling_info'] = '~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ Rodar\n~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ Mudar Força\n~INPUT_MOVE_LEFT_ONLY~ ~INPUT_MOVE_RIGHT_ONLY~ Mudar de Camara\n~INPUT_ATTACK~ Lançar\n~INPUT_FRONTEND_RRIGHT~ Parar de Jogar',
    ['force'] = 'Força: %s',
    ['strike'] = {'PARABENS CARAIO', 'CONSEGUISTE UM STRIKE!!'},
    ['spare'] = {'Bowling', 'Bem-Jogado! Tens um sobressalente'},
    ['x_pinsdown'] = {'Bowling', 'Conseguiste %s de %s pins'},
    ['this_occupied'] = 'Esta pista de bowling está ocupada.',
    ['every_occupied'] = 'Todas as pistas de bowling estão ocupadas.',
    ['blip'] = 'Bowling'
}