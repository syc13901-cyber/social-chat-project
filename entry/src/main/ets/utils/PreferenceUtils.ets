import { preferences } from "@kit.ArkData";
import { JSON } from "@kit.ArkTS";

export class PreferenceUtil {
    private preferenceList: Map<string, preferences.Preferences> = new Map();

    /**
     * 初始化
     */
    loadPreference(context: Context, name: string): void {
        try {
            const dataPreferences: preferences.Preferences = preferences.getPreferencesSync(context, { name });
            this.preferenceList.set(name, dataPreferences);
        } catch (error) {
        }
    }

    /**
     * 保存数据
     */
    async putPreferenceValue(name: string, key: string, value: preferences.ValueType): Promise<void> {
        if (!this.preferenceList.has(name)) {
            return;
        }
        try {
            const pref = this.preferenceList.get(name);
            await pref?.put(key, value)
            await pref?.flush();
        } catch (error) {
        }
    }

    /**
     * 获取数据
     */
    async getPreferenceValue(name: string, key: string, defaultValue: preferences.ValueType): Promise<void | preferences.ValueType> {
        if (!this.preferenceList.has(name)) {
            return;
        }
        try {
            const pref = this.preferenceList.get(name);
            const value = await pref?.get(key, defaultValue);
            return value;
        } catch (error) {
        }
    }
}

export default new PreferenceUtil();