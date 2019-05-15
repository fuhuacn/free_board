package action;

import entity.CarddataEntity;
import manager.CarddataManager;

import java.util.Random;

/**
 * @author 付华
 * @create 2017/11/20 16:47
 * @since 1.0.0
 */
public class SaveData {
    public static Integer saveData(CarddataEntity c) {
        Integer id = c.getId();
        try {
            CarddataManager.save(c);
        } catch (Exception e) {
            id = new Random().nextInt(999999999) + 1;
            saveData(c);
        }
        return id;
    }
}
