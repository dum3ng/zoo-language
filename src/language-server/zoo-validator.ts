import { ValidationAcceptor, ValidationChecks } from 'langium';
import { ZooAstType, Room  } from './generated/ast';
import type { ZooServices } from './zoo-module';

/**
 * Register custom validation checks.
 */
export function registerValidationChecks(services: ZooServices) {
    const registry = services.validation.ValidationRegistry;
    const validator = services.validation.ZooValidator;
    const checks: ValidationChecks<ZooAstType> = {
        Room: validator.checkPersonStartsWithCapital
    };
    registry.register(checks, validator);
}

/**
 * Implementation of custom validations.
 */
export class ZooValidator {

    checkPersonStartsWithCapital(room: Room, accept: ValidationAcceptor): void {
        if (room.name) {
            const firstChar = room.name.substring(0, 1);
            if (firstChar.toUpperCase() !== firstChar) {
                accept('warning', 'Room name should start with a capital.', { node: room, property: 'name' });
            }
        }
    }

}
