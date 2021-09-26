from talon import Context, Module, actions, ctrl
from talon.experimental.locate import locate, locate_hover

ctx = Context()
mod = Module()

@mod.action_class
class Actions:
    def hover_center_image(imageName: str,):
        """centers mouse over the image"""

        # starts in the .talon directory for the image file path
        locate_hover(f"./screen-captures/{imageName}.png", threshold=0.80)

    def click_center_image(imageName: str):
        """clicks the center of the image"""
        hover_center_image(imageName)
        actions.mouse_click(0)

    def screen_contains_image(imageName: str):
        """returns first match if the image is found, otherwise returns false"""

        results = locate(f"./screen-captures/{imageName}.png", threshold=0.90)
        
        if (len(results) == 0):
            return False
        else:
            return results[0]

    # def hover_center_image_rect(imageName: str, x1: int, y1: int, x2: int, y2: int):
    # locate_hover(f"./screen-captures/{imageName}.png", threshold=0.80, rect=RECT_HERE)

    # quadrants
    # 1: top right
    # 2: top left
    # 3: bottom left
    # 4: bottom right

    # def hover_center_image_quadrant(imageName: str, quadrant: int):
    # e.g. top right quadrant of screen

    # def hover_center_image_subquadrant(imageName: str, quadrant: int, subquadrant: int):
    # e.g. top right quadrant of screen
