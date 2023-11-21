import Foundation

class LessonLibrary{
    var im_lvl_lib: [Imagelevel]
    var lessons: [Lesson]
    
    init(){
        self.im_lvl_lib = ImageLevelLibrary().levels
        
        lessons = [
            Lesson(sfSymbol: "star.fill", levels:
                    [
                        im_lvl_lib[0],
                        im_lvl_lib[1],
                        im_lvl_lib[2],
                    ]
            ),
            Lesson(sfSymbol: "star.fill", levels:
                    [
                        im_lvl_lib[3],
                        im_lvl_lib[4],
                        im_lvl_lib[5],
                    ]
            ),
            Lesson(sfSymbol: "book.fill", levels:
                    [
                        im_lvl_lib[6],
                        im_lvl_lib[7],
                        im_lvl_lib[8],
                    ]
            ),
            Lesson(sfSymbol: "star.fill", levels:
                    [
                        im_lvl_lib[9],
                        im_lvl_lib[10],
                        im_lvl_lib[11],
                    ]
            ),
            // vvv Below are empty placeholder levels vvv //
            
            Lesson(sfSymbol: "book.fill", levels:
                    [
                        im_lvl_lib[0],
                        im_lvl_lib[1],
                        im_lvl_lib[2],
                    ]
            ),
            Lesson(sfSymbol: "star.fill", levels:
                    [
                        im_lvl_lib[3],
                        im_lvl_lib[4],
                        im_lvl_lib[5],
                    ]
            ),
            Lesson(sfSymbol: "book.fill", levels:
                    [
                        im_lvl_lib[6],
                        im_lvl_lib[7],
                        im_lvl_lib[8],
                    ]
            ),
            Lesson(sfSymbol: "star.fill", levels:
                    [
                        im_lvl_lib[9],
                        im_lvl_lib[10],
                        im_lvl_lib[11],
                    ]
            ),
            
            Lesson(sfSymbol: "star.fill", levels:
                    [
                        im_lvl_lib[0],
                        im_lvl_lib[1],
                        im_lvl_lib[2],
                    ]
            ),
            
        ]
    }
}

class ImageLevelLibrary{
    var im_card_lib: [ImagelevelCard]
    var levels: [Imagelevel]
    
    init() {
        self.im_card_lib = ImageLevelCardsLibrary().imageLevelCards

        levels = [
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[0],
                    im_card_lib[12],
                    im_card_lib[24],
                    im_card_lib[36],
                ]
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[1],
                    im_card_lib[13],
                    im_card_lib[25],
                    im_card_lib[37],
                ]
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[2],
                    im_card_lib[14],
                    im_card_lib[26],
                    im_card_lib[38],
                ]
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[3],
                    im_card_lib[15],
                    im_card_lib[27],
                    im_card_lib[39],
                ]
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[4],
                    im_card_lib[16],
                    im_card_lib[28],
                    im_card_lib[40],
                ]
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[5],
                    im_card_lib[17],
                    im_card_lib[29],
                    im_card_lib[41],
                ]
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[6],
                    im_card_lib[18],
                    im_card_lib[30],
                    im_card_lib[42],
                ]
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[7],
                    im_card_lib[19],
                    im_card_lib[31],
                    im_card_lib[43],
                ]
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[8],
                    im_card_lib[20],
                    im_card_lib[32],
                    im_card_lib[44],
                ]
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[10],
                    im_card_lib[21],
                    im_card_lib[33],
                    im_card_lib[45],
                ]
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[11],
                    im_card_lib[22],
                    im_card_lib[34],
                    im_card_lib[46],
                ]
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[9],
                    im_card_lib[23],
                    im_card_lib[35],
                    im_card_lib[46],
                ]
            ),
        ]
    }
}

class ImageLevelCardsLibrary{
    var imageLevelCards: [ImagelevelCard] = [
        ImagelevelCard(lottie: "pizza", english: "pizza", italian: "pizza"),
        ImagelevelCard(lottie: "tomato", english: "tomato", italian: "pomodoro"),
        ImagelevelCard(lottie: "ice_cream", english: "ice cream", italian: "gelato"),
        ImagelevelCard(lottie: "watermelon", english: "watermelon", italian: "anguria"),
        ImagelevelCard(lottie: "apple", english: "apple", italian: "mela"),
        ImagelevelCard(lottie: "bananas", english: "bananas", italian: "banane"),
        ImagelevelCard(lottie: "beer", english: "beer", italian: "birra"),
        ImagelevelCard(lottie: "burger", english: "burger", italian: "hamburger"),
        ImagelevelCard(lottie: "cake", english: "cake", italian: "torta"),
        ImagelevelCard(lottie: "cancer", english: "cancer", italian: "cancro"),
        ImagelevelCard(lottie: "candy", english: "candy", italian: "caramella"),
        ImagelevelCard(lottie: "canned_food", english: "canned food", italian: "cibo in scatola"),
        ImagelevelCard(lottie: "carrot", english: "carrot", italian: "carota"),
        ImagelevelCard(lottie: "cheese", english: "cheese", italian: "formaggio"),
        ImagelevelCard(lottie: "cherry", english: "cherry", italian: "ciliegia"),
        ImagelevelCard(lottie: "chocolate", english: "chocolate", italian: "cioccolato"),
        ImagelevelCard(lottie: "corn", english: "corn", italian: "mais"),
        ImagelevelCard(lottie: "cracker", english: "cracker", italian: "cracker"),
        ImagelevelCard(lottie: "croissant", english: "croissant", italian: "cornetto"),
        ImagelevelCard(lottie: "cupcake", english: "cupcake", italian: "cupcake"),
        ImagelevelCard(lottie: "donut", english: "donut", italian: "ciambella"),
        ImagelevelCard(lottie: "egg", english: "egg", italian: "uovo"),
        ImagelevelCard(lottie: "eggplant", english: "eggplant", italian: "melanzana"),
        ImagelevelCard(lottie: "fish", english: "fish", italian: "pesce"),
        ImagelevelCard(lottie: "fried_eggs", english: "fried eggs", italian: "uova strapazzate"),
        ImagelevelCard(lottie: "fries", english: "fries", italian: "patatine fritte"),
        ImagelevelCard(lottie: "honey", english: "honey", italian: "miele"),
        ImagelevelCard(lottie: "hot_dog", english: "hot dog", italian: "hot dog"),
        ImagelevelCard(lottie: "leaf", english: "leaf", italian: "foglia"),
        ImagelevelCard(lottie: "lemon", english: "lemon", italian: "limone"),
        ImagelevelCard(lottie: "lemonade", english: "lemonade", italian: "limonata"),
        ImagelevelCard(lottie: "mashroom", english: "mashroom", italian: "fungo"),
        ImagelevelCard(lottie: "melon", english: "melon", italian: "melone"),
        ImagelevelCard(lottie: "menu", english: "menu", italian: "menu"),
        ImagelevelCard(lottie: "mixer", english: "mixer", italian: "frullatore"),
        ImagelevelCard(lottie: "olive", english: "olive", italian: "oliva"),
        ImagelevelCard(lottie: "pear", english: "pear", italian: "pera"),
        ImagelevelCard(lottie: "pepper", english: "pepper", italian: "peperone"),
        ImagelevelCard(lottie: "pudding", english: "pudding", italian: "budino"),
        ImagelevelCard(lottie: "shrimp", english: "shrimp", italian: "gamberetto"),
        ImagelevelCard(lottie: "soup", english: "soup", italian: "zuppa"),
        ImagelevelCard(lottie: "strawberry", english: "strawberry", italian: "fragola"),
        ImagelevelCard(lottie: "sushi", english: "sushi", italian: "sushi"),
        ImagelevelCard(lottie: "taco", english: "taco", italian: "taco"),
        ImagelevelCard(lottie: "tea", english: "tea", italian: "tè"),
        ImagelevelCard(lottie: "toaster", english: "toaster", italian: "tostapane"),
        ImagelevelCard(lottie: "water", english: "water", italian: "acqua"),
    ]
}
