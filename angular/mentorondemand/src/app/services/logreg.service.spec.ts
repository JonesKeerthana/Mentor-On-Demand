import { TestBed } from '@angular/core/testing';

import { LogregService } from './logreg.service';

describe('LogregService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: LogregService = TestBed.get(LogregService);
    expect(service).toBeTruthy();
  });
});
