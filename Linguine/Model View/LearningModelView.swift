import Foundation

class LessonLibrary{
    var im_lvl_lib: [Imagelevel]
    var HDYS_lvl_lib: [HDYSlevel]
    var lessons: [Lesson]
    
    init(){
        self.im_lvl_lib = ImageLevelLibrary().levels
        self.HDYS_lvl_lib = HDYSLevelLibrary().levels
        
        lessons = [
            Lesson(sfSymbol: "star.fill", levels:
                    [
                        im_lvl_lib[0],
                        im_lvl_lib[1],
                        HDYS_lvl_lib[0],
                    ]
            ),
            Lesson(sfSymbol: "star.fill", levels:
                    [
                        im_lvl_lib[2],
                        im_lvl_lib[3],
                        HDYS_lvl_lib[1],
                    ]
            ),
            Lesson(sfSymbol: "book.fill", levels:
                    [
                        im_lvl_lib[4],
                        im_lvl_lib[5],
                        HDYS_lvl_lib[2],
                    ]
            ),
            Lesson(sfSymbol: "star.fill", levels:
                    [
                        im_lvl_lib[6],
                        im_lvl_lib[7],
                        HDYS_lvl_lib[3],
                    ]
            ),
            Lesson(sfSymbol: "star.fill", levels:
                    [
                        im_lvl_lib[8],
                        im_lvl_lib[9],
                        HDYS_lvl_lib[4],
                    ]
            ),
            Lesson(sfSymbol: "star.fill", levels:
                    [
                        im_lvl_lib[10],
                        im_lvl_lib[11],
                        HDYS_lvl_lib[5],
                    ]
            ),
            
            // vvv Below are empty placeholder levels vvv //
            
            Lesson(sfSymbol: "book.fill", levels:
                    [
                        im_lvl_lib[0],
                    ]
            ),
            Lesson(sfSymbol: "star.fill", levels:
                    [
                        im_lvl_lib[0],
                    ]
            ),
            Lesson(sfSymbol: "book.fill", levels:
                    [
                        im_lvl_lib[0],
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
                ], levelType: .imageLevel
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[1],
                    im_card_lib[13],
                    im_card_lib[25],
                    im_card_lib[37],
                ], levelType: .imageLevel
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[2],
                    im_card_lib[14],
                    im_card_lib[26],
                    im_card_lib[38],
                ], levelType: .imageLevel
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[3],
                    im_card_lib[15],
                    im_card_lib[27],
                    im_card_lib[39],
                ], levelType: .imageLevel
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[4],
                    im_card_lib[16],
                    im_card_lib[28],
                    im_card_lib[40],
                ], levelType: .imageLevel
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[5],
                    im_card_lib[17],
                    im_card_lib[29],
                    im_card_lib[41],
                ], levelType: .imageLevel
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[6],
                    im_card_lib[18],
                    im_card_lib[30],
                    im_card_lib[42],
                ], levelType: .imageLevel
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[7],
                    im_card_lib[19],
                    im_card_lib[31],
                    im_card_lib[43],
                ], levelType: .imageLevel
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[8],
                    im_card_lib[20],
                    im_card_lib[32],
                    im_card_lib[44],
                ], levelType: .imageLevel
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[10],
                    im_card_lib[21],
                    im_card_lib[33],
                    im_card_lib[45],
                ], levelType: .imageLevel
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[11],
                    im_card_lib[22],
                    im_card_lib[34],
                    im_card_lib[46],
                ], levelType: .imageLevel
            ),
            
            Imagelevel(imageLevelCards:
                [
                    im_card_lib[9],
                    im_card_lib[23],
                    im_card_lib[35],
                    im_card_lib[46],
                ], levelType: .imageLevel
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

class HDYSLevelLibrary{
    var hdys_card_lib: [HDYSlevelCard]
    var levels: [HDYSlevel]
    
    init() {
        self.hdys_card_lib = HDYSLevelCardsLibrary().HDYSLevelCards

        levels = [
            HDYSlevel(imageLevelCards: [
                hdys_card_lib[0],
                hdys_card_lib[1],
                hdys_card_lib[2]
            ], levelType: .HDYSLevel
            ),
            
            HDYSlevel(imageLevelCards: [
                hdys_card_lib[3],
                hdys_card_lib[4],
                hdys_card_lib[5]
            ], levelType: .HDYSLevel
            ),
            
            HDYSlevel(imageLevelCards: [
                hdys_card_lib[6],
                hdys_card_lib[7],
                hdys_card_lib[8]
            ], levelType: .HDYSLevel
            ),
            
            HDYSlevel(imageLevelCards: [
                hdys_card_lib[9],
                hdys_card_lib[10],
                hdys_card_lib[11]
            ], levelType: .HDYSLevel
            ),
            
            HDYSlevel(imageLevelCards: [
                hdys_card_lib[12],
                hdys_card_lib[13],
                hdys_card_lib[14]
            ], levelType: .HDYSLevel
            ),
            
            HDYSlevel(imageLevelCards: [
                hdys_card_lib[15],
                hdys_card_lib[16],
                hdys_card_lib[17]
            ], levelType: .HDYSLevel
            ),
        ]
    }
}

class HDYSLevelCardsLibrary{
    var HDYSLevelCards: [HDYSlevelCard] = [
        HDYSlevelCard(english: "girl", italian: "ragazza"),
        HDYSlevelCard(english: "car", italian: "auto"),
        HDYSlevelCard(english: "dog", italian: "cane"),
        HDYSlevelCard(english: "cat", italian: "gatto"),
        HDYSlevelCard(english: "house", italian: "casa"),
        HDYSlevelCard(english: "book", italian: "libro"),
        HDYSlevelCard(english: "tree", italian: "albero"),
        HDYSlevelCard(english: "sun", italian: "sole"),
        HDYSlevelCard(english: "water", italian: "acqua"),
        HDYSlevelCard(english: "food", italian: "cibo"),
        HDYSlevelCard(english: "friend", italian: "amico"),
        HDYSlevelCard(english: "time", italian: "tempo"),
        HDYSlevelCard(english: "apple", italian: "mela"),
        HDYSlevelCard(english: "table", italian: "tavolo"),
        HDYSlevelCard(english: "flower", italian: "fiore"),
        HDYSlevelCard(english: "computer", italian: "computer"),
        HDYSlevelCard(english: "family", italian: "famiglia"),
        HDYSlevelCard(english: "color", italian: "colore"),
    ]
}

enum LevelType: String {
    case imageLevel = "Image Level"
    case HDYSLevel = "HDYS Level"
}
