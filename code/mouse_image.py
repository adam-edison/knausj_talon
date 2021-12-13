from talon import Context, Module, actions, ctrl
from talon.experimental.locate import locate, locate_hover

ctx = Context()
mod = Module()

@mod.action_class
class Actions:
    def hover_center_image(imageName: str, threshold: float=0.90):
        """centers mouse over the image"""

        # starts in the .talon directory for the image file path
        print(image_location(imageName))
        locate_hover(image_location(imageName), threshold=threshold)

    def click_center_image(imageName: str, threshold: float=0.90):
        """clicks the center of the image"""
        actions.user.hover_center_image(imageName, threshold=threshold)
        actions.mouse_click(0)

    # def screen_contains_image_top_half(imageName: str, threshold: float=0.90):
    #     """returns first match if the image is found in the top half of the screen, otherwise returns false"""
    #     top_half = 
    #     results = locate(image_location(imageName), threshold=threshold, rect=)
    #     return results[0] if (len(results) == 0) else False


    def get_image_locations(imageName: str, threshold: float=0.90):
        """returns all locations as array of rectangles if image is found, otherwise throws an exception"""
        try:
            return locate(image_location(imageName), threshold=threshold)
        except:
            raise RuntimeError(f"Unable to locate control by image {imageName}")

    # def hover_center_image_rect(imageName: str, x1: int, y1: int, x2: int, y2: int):
    # locate_hover(image_location(imageName), threshold=0.80, rect=RECT_HERE)

    # quadrants
    # 1: top right
    # 2: top left
    # 3: bottom left
    # 4: bottom right

    # def hover_center_image_quadrant(imageName: str, quadrant: int):
    # e.g. top right quadrant of screen

    # def hover_center_image_subquadrant(imageName: str, quadrant: int, subquadrant: int):
    # e.g. top right quadrant of screen

def image_location(imageName:str):
    return f"./screen-captures/{imageName}.png"
